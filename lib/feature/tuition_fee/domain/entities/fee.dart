import 'lophocs.dart';

class Fee {
  int id;
  String maHocVien;
  String tenHocVien;
  String tenPhuHuynh;
  String diaChi;
  String soDienThoai;
  List<LstLopHoc> lstLopHoc;
  double tongHocPhiDaDong;
  double tongHocPhiChuaDong;

  Fee(
      {this.id,
        this.maHocVien,
        this.tenHocVien,
        this.tenPhuHuynh,
        this.diaChi,
        this.soDienThoai,
        this.lstLopHoc,
        this.tongHocPhiDaDong,
        this.tongHocPhiChuaDong});

  Fee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    maHocVien = json['maHocVien'];
    tenHocVien = json['tenHocVien'];
    tenPhuHuynh = json['tenPhuHuynh'];
    diaChi = json['diaChi'];
    soDienThoai = json['soDienThoai'];
    if (json['lstLopHoc'] != null) {
      lstLopHoc = new List<LstLopHoc>();
      json['lstLopHoc'].forEach((v) {
        lstLopHoc.add(new LstLopHoc.fromJson(v));
      });
    }
    tongHocPhiDaDong = json['tongHocPhiDaDong'];
    tongHocPhiChuaDong = json['tongHocPhiChuaDong'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['maHocVien'] = this.maHocVien;
    data['tenHocVien'] = this.tenHocVien;
    data['tenPhuHuynh'] = this.tenPhuHuynh;
    data['diaChi'] = this.diaChi;
    data['soDienThoai'] = this.soDienThoai;
    if (this.lstLopHoc != null) {
      data['lstLopHoc'] = this.lstLopHoc.map((v) => v.toJson()).toList();
    }
    data['tongHocPhiDaDong'] = this.tongHocPhiDaDong;
    data['tongHocPhiChuaDong'] = this.tongHocPhiChuaDong;
    return data;
  }
}
