import 'dart:convert';
import 'package:fai_kul/main/main_utils.dart';
import 'package:fai_kul/main/nar_drawer/home_page.dart';
import 'package:fai_kul/main/nar_drawer/page_route.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:quiver/collection.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:fai_kul/feature/camera/face_painter.dart';
import 'package:fai_kul/feature/camera/utils.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/foundation.dart';
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;
import 'package:image/image.dart' as imglib;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter/services.dart';
List<imglib.Image> listTrainImage = List<imglib.Image>();

class FaceDetectionFromLiveCamera extends StatefulWidget {
  FaceDetectionFromLiveCamera({Key key}) : super(key: key);

  @override
  _FaceDetectionFromLiveCameraState createState() =>
      _FaceDetectionFromLiveCameraState();
}

GlobalKey<_FaceDetectionFromLiveCameraState> trainGlobalKey =
    new GlobalKey<_FaceDetectionFromLiveCameraState>();

class _FaceDetectionFromLiveCameraState
    extends State<FaceDetectionFromLiveCamera> {
  BuildContext xxcontext = null;
  double tx = 0, ty = 0, tw = 0, th = 0;
  dynamic data = {};
  File jsonFile;
  int numberImgTrain = 20;
  bool isTraining = false;
  Directory tempDir;
  double progressRate = 0;
  final FaceDetector faceDetector = FirebaseVision.instance.faceDetector();
  List<Face> faces;
  CameraController _camera;
  var interpreter;
  bool _isDetecting = false;
  CameraLensDirection _direction = CameraLensDirection.front;

  void disposeCamera() {
    setState(() {
      _camera = null;
    });
  }

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    _camera.dispose();
    _camera = null;
    super.dispose();
  }


  void _initializeCamera() async {
    loadModel();
    CameraDescription description = await getCamera(_direction);
    ImageRotation rotation = rotationIntToImageRotation(
      description.sensorOrientation,
    );

    _camera = CameraController(
      description,
      defaultTargetPlatform == TargetPlatform.iOS
          ? ResolutionPreset.low
          : ResolutionPreset.high,
    );

    await Future.delayed(Duration(milliseconds: 500));
    tempDir = await getApplicationDocumentsDirectory();
    String _embPath = tempDir.path + '/emb.json';
    print("_embPath$_embPath");
    jsonFile = new File(_embPath);
    if (jsonFile.existsSync()) data = json.decode(jsonFile.readAsStringSync());


    await _camera.initialize();

    _camera.startImageStream((CameraImage image) {
      if (_isDetecting) return;

      _isDetecting = true;

      detect(image, FirebaseVision.instance.faceDetector().processImage,
              rotation)
          .then(
        (dynamic result) async {
          Face _face;
          imglib.Image convertedImage = _convertCameraImage(image, _direction);
          for (_face in result) {
            double x, y, w, h;
            if (isTraining) {
              x = (_face.boundingBox.left - 10);
              y = (_face.boundingBox.top - 10);
              w = (_face.boundingBox.width + 10);
              h = (_face.boundingBox.height + 10);
              tx == 0 ? x : tx;
              ty == 0 ? y : ty;
              tw == 0 ? w : tw;
              th == 0 ? h : th;
              if ((tx < x - 20.0 || tx > x + 20.0) ||
                  (ty < y - 20.0 || ty > y + 20.0) ||
                  (tw < w - 20.0 || tw > w + 20.0) ||
                  (th < h - 20.0 || th > h + 20.0)) {
                imglib.Image croppedImage = imglib.copyCrop(
                    convertedImage, x.round(), y.round(), w.round(), h.round());
                croppedImage = imglib.copyResizeCropSquare(croppedImage, 112);
                // int startTime = new DateTime.now().millisecondsSinceEpoch;
                listTrainImage.add(croppedImage);
                print("listTrainImage: ${listTrainImage.length}");
                setState(() {
                  double temp = double.parse(
                      (listTrainImage.length / numberImgTrain)
                          .toStringAsFixed(2));
                  if (temp >= 1) {
                    progressRate = 1;
                    isTraining = false;
                    addTrainImage();
                  }
                  progressRate = temp;
                });
                print("aasasasQ${progressRate}");

                //cap nhap lai
                tx = x;
                ty = y;
                tw = w;
                th = h;
              } else {
                print("Hinh trung");
              }
            }
          }
          setState(() {
            faces = result;
          });

          _isDetecting = false;
        },
      ).catchError(
        (_) {
          _isDetecting = false;
        },
      );
    });
  }

  Widget _buildResults() {
    const Text noResultsText = const Text('No results!');

    if (faces == null || _camera == null || !_camera.value.isInitialized) {
      return noResultsText;
    }

    CustomPainter painter;

    final Size imageSize = Size(
      _camera.value.previewSize.height,
      _camera.value.previewSize.width,
    );

    if (faces is! List<Face>) return noResultsText;
    painter = SmilePainterLiveCamera(imageSize, faces);

    return CustomPaint(
      painter: painter,
    );
  }


  Widget _buildImage() {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: _camera == null
          ? const Center(
              child: Text(
                'Initializing Camera...',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 30.0,
                ),
              ),
            )
          : Stack(
              fit: StackFit.expand,
              children: <Widget>[
                CameraPreview(_camera),
                _buildResults(),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                      color: Colors.white,
                      height: 150,
                      child: Column(
                        children: [
                          Text(
                            "Đăng kí khuôn mặt nhận diện",
                            style: TextStyle(fontSize: 20),
                          ),
                          isTraining
                              ? CircularPercentIndicator(
                                  radius: 60.0,
                                  lineWidth: 5.0,
                                  percent: progressRate,
                                  center: new Text("${(progressRate * 100).toStringAsFixed(0)}%"),
                                  progressColor: Colors.green,
                                )
                              : progressRate != 1.0
                                  ? RaisedButton(
                                      child: Text("Bắt đầu"),
                                      onPressed: () {
                                        setState(() {
                                          isTraining = !isTraining;
                                        });
                                      },
                                    )
                                  : Text("Đăng kí thành công", style: TextStyle(fontSize: 15, color: Colors.green),)
                        ],
                      )),
                ),
              ],
            ),
    );
  }

  void _toggleCameraDirection() async {
    if (_direction == CameraLensDirection.back) {
      _direction = CameraLensDirection.front;
    } else {
      _direction = CameraLensDirection.back;
    }

    await _camera.stopImageStream();
    await _camera.dispose();

    setState(() {
      _camera = null;
    });

    _initializeCamera();
  }

  @override
  Widget build(BuildContext context) {
    xxcontext = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("Đăng kí khuôn mặt"),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage(key: textGlobalKey,)),
            );
          },
        ),
      ),
      body: _buildImage(),

      floatingActionButton: FloatingActionButton(
        onPressed: _toggleCameraDirection,
        child: _direction == CameraLensDirection.back
            ? const Icon(Icons.camera_front)
            : const Icon(Icons.camera_rear),
      ),
    );
  }

  void _showSuccessfulDialog() {
    print("_showSuccessfulDialog");
    if (xxcontext != null) {
      var alert = new AlertDialog(
        backgroundColor: Colors.white,
        title:  Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/icons/yes_icon.png"),
              SizedBox(height: 5,),
              Text("Thành công", style: TextStyle(fontSize: 30),),
              SizedBox(height: 10,),
              Text("Bạn đã đăng kí nhận diện thành công", style: TextStyle(fontSize: 20),),
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: Text("OK", style: TextStyle(fontSize: 20),),
            onPressed: () {
              _camera.dispose();
              _camera = null;
              Navigator.pushReplacementNamed(xxcontext, PageRoutes.home);
            },
          )
        ],
      );
      showDialog(
          context: xxcontext,
          builder: (context) {
            return alert;
          });
    }
  }

    void addTrainImage(){
    print(" addTrainImage${getCurrentUser().username}");
      print("addTrainImage");
      if(listTrainImage.length > 0){
        for(var x in listTrainImage){
          print("addTrainImagexxx");
          data["${getCurrentUser().username}"] = _recog2(x);
          jsonFile.writeAsStringSync(json.encode(data));
        }
        _showSuccessfulDialog();
      }
    }


  Future loadModel() async {
    try {
      final gpuDelegateV2 = tfl.GpuDelegateV2(
          options: tfl.GpuDelegateOptionsV2(
            true,
            tfl.TfLiteGpuInferenceUsage.preferenceSustainSpeed,
            tfl.TfLiteGpuInferencePriority.auto,
            tfl.TfLiteGpuInferencePriority.auto,
            tfl.TfLiteGpuInferencePriority.auto,
          ));

      var interpreterOptions = tfl.InterpreterOptions()
        ..addDelegate(gpuDelegateV2);
      interpreter = await tfl.Interpreter.fromAsset('mobilefacenet.tflite',
          options: interpreterOptions);
      print('Load model successfull.');
    } on Exception {
      print('Failed to load model.');
    }
  }


  List _recog2(imglib.Image img) {
    List input = imageToByteListFloat32(img, 112, 128, 128);
    input = input.reshape([1, 112, 112, 3]);
    List output = List(1 * 192).reshape([1, 192]);
    interpreter.run(input, output);
    output = output.reshape([192]);
    print("_recog2");
    return List.from(output);
  }

}

imglib.Image _convertCameraImage(CameraImage image, CameraLensDirection _dir) {
  int width = image.width;
  int height = image.height;
  // imglib -> Image package from https://pub.dartlang.org/packages/image
  var img = imglib.Image(width, height); // Create Image buffer
  const int hexFF = 0xFF000000;
  final int uvyButtonStride = image.planes[1].bytesPerRow;
  final int uvPixelStride = image.planes[1].bytesPerPixel;
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      final int uvIndex =
          uvPixelStride * (x / 2).floor() + uvyButtonStride * (y / 2).floor();
      final int index = y * width + x;
      final yp = image.planes[0].bytes[index];
      final up = image.planes[1].bytes[uvIndex];
      final vp = image.planes[2].bytes[uvIndex];
      // Calculate pixel color
      int r = (yp + vp * 1436 / 1024 - 179).round().clamp(0, 255);
      int g = (yp - up * 46549 / 131072 + 44 - vp * 93604 / 131072 + 91)
          .round()
          .clamp(0, 255);
      int b = (yp + up * 1814 / 1024 - 227).round().clamp(0, 255);
      // color: 0x FF  FF  FF  FF
      //           A   B   G   R
      img.data[index] = hexFF | (b << 16) | (g << 8) | r;
    }
  }
  var img1 = (_dir == CameraLensDirection.front)
      ? imglib.copyRotate(img, -90)
      : imglib.copyRotate(img, 90);
  return img1;
}

