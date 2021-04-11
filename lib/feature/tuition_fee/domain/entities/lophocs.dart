import 'chi_tiet.dart';

class LstLopHoc {
  String tenLopHoc;
  int hocPhi;
  String coSo;
  bool daDongHocPhi;
  int soTienDaDong;
  int soTienChuaDong;
  List<ChiTiet> chiTiet;

  LstLopHoc(
      {this.tenLopHoc,
        this.hocPhi,
        this.coSo,
        this.daDongHocPhi,
        this.soTienDaDong,
        this.soTienChuaDong,
        this.chiTiet});

  LstLopHoc.fromJson(Map<String, dynamic> json) {
    tenLopHoc = json['tenLopHoc'];
    hocPhi = json['hocPhi'];
    coSo = json['coSo'];
    daDongHocPhi = json['daDongHocPhi'];
    soTienDaDong = json['soTienDaDong'];
    soTienChuaDong = json['soTienChuaDong'];
    if (json['chiTiet'] != null) {
      chiTiet = new List<ChiTiet>();
      json['chiTiet'].forEach((v) {
        chiTiet.add(new ChiTiet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tenLopHoc'] = this.tenLopHoc;
    data['hocPhi'] = this.hocPhi;
    data['coSo'] = this.coSo;
    data['daDongHocPhi'] = this.daDongHocPhi;
    data['soTienDaDong'] = this.soTienDaDong;
    data['soTienChuaDong'] = this.soTienChuaDong;
    if (this.chiTiet != null) {
      data['chiTiet'] = this.chiTiet.map((v) => v.toJson()).toList();
    }
    return data;
  }
}