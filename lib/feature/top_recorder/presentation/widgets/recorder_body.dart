import 'package:fai_kul/feature/login/presentation/widgets/loading_widget.dart';
import 'package:fai_kul/feature/top_recorder/domain/entities/toprecorder_swagger.dart';
import 'package:fai_kul/feature/top_recorder/presentation/manager/top_recoder/top_recoder_bloc.dart';
import 'package:fai_kul/feature/top_recorder/presentation/widgets/recorder_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecorderBody extends StatefulWidget {
  final int state;

  const RecorderBody({Key key, this.state}) : super(key: key);
  @override
  _RecorderBodyState createState() => _RecorderBodyState();
}

class _RecorderBodyState extends State<RecorderBody> {
  @override
  Widget build(BuildContext context) {
    getListRecorder();
    return Container(
      child: Column(
        children: [
          SizedBox(height: 10,),
          BlocBuilder<TopRecoderBloc, TopRecoderState>(
            builder: (context, state){
              if(state is Empty){
                return Text("");
              } else
              if(state is Loading) {
                return LoadingWidget();
              } else
              if(state is Loaded){
                print("rerorder list state: ${state.topRecorderSwagger.data.length}");
                List<TopRecorder> list =  state.topRecorderSwagger.data;
                return list.length > 0 ? RecorderList(data: state.topRecorderSwagger, state:  widget.state,): Center(child: Text("Hiện tại chưa có thông tin mới"),);
              }   else
                if(state is Error){
                  return Text("Có lỗi đang xảy ra");
                }
              return null;
            },
          ),
        ],
      ),
    );
  }

  void getListRecorder() {
    BlocProvider.of<TopRecoderBloc>(context).add(GetTopRecoderEvent());
  }
}
