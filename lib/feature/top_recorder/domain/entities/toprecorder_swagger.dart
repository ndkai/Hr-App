class TopRecorderSwagger {
  bool success;
  int statusCode;
  Null meta;
  List<TopRecorder> data;
  Null message;

  TopRecorderSwagger(
      {this.success, this.statusCode, this.meta, this.data, this.message});

  TopRecorderSwagger.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    meta = json['meta'];
    if (json['data'] != null) {
      data = new List<TopRecorder>();
      json['data'].forEach((v) {
        data.add(new TopRecorder.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    data['meta'] = this.meta;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class TopRecorder {
  int id;
  String ngay;
  TietHoc tietHoc;
  LopHoc lopHoc;
  GiaoVien giaoVien;
  int danhGia;
  String diemDanh;
  String baiHoc;
  String baiTapVeNha;
  String nhanXet;

  TopRecorder(
      {this.id,
        this.ngay,
        this.tietHoc,
        this.lopHoc,
        this.giaoVien,
        this.danhGia,
        this.diemDanh,
        this.baiHoc,
        this.baiTapVeNha,
        this.nhanXet});

  TopRecorder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ngay = json['ngay'];
    tietHoc =
    json['TietHoc'] != null ? new TietHoc.fromJson(json['TietHoc']) : null;
    lopHoc =
    json['LopHoc'] != null ? new LopHoc.fromJson(json['LopHoc']) : null;
    giaoVien = json['GiaoVien'] != null
        ? new GiaoVien.fromJson(json['GiaoVien'])
        : null;
    danhGia = json['danhGia'];
    diemDanh = json['diemDanh'];
    baiHoc = json['baiHoc'];
    baiTapVeNha = json['baiTapVeNha'];
    nhanXet = json['nhanXet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ngay'] = this.ngay;
    if (this.tietHoc != null) {
      data['TietHoc'] = this.tietHoc.toJson();
    }
    if (this.lopHoc != null) {
      data['LopHoc'] = this.lopHoc.toJson();
    }
    if (this.giaoVien != null) {
      data['GiaoVien'] = this.giaoVien.toJson();
    }
    data['danhGia'] = this.danhGia;
    data['diemDanh'] = this.diemDanh;
    data['baiHoc'] = this.baiHoc;
    data['baiTapVeNha'] = this.baiTapVeNha;
    data['nhanXet'] = this.nhanXet;
    return data;
  }
}

class TietHoc {
  int id;
  String tenTietHoc;

  TietHoc({this.id, this.tenTietHoc});

  TietHoc.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenTietHoc = json['tenTietHoc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tenTietHoc'] = this.tenTietHoc;
    return data;
  }
}

class LopHoc {
  int id;
  String tenLopHoc;

  LopHoc({this.id, this.tenLopHoc});

  LopHoc.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenLopHoc = json['tenLopHoc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tenLopHoc'] = this.tenLopHoc;
    return data;
  }
}

class GiaoVien {
  int id;
  String tenGiaoVien;

  GiaoVien({this.id, this.tenGiaoVien});

  GiaoVien.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenGiaoVien = json['tenGiaoVien'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tenGiaoVien'] = this.tenGiaoVien;
    return data;
  }
}