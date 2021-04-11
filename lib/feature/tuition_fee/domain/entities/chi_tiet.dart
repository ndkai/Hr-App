class ChiTiet {
  String ngayDong;
  int soTien;

  ChiTiet({this.ngayDong, this.soTien});

  ChiTiet.fromJson(Map<String, dynamic> json) {
    ngayDong = json['ngayDong'];
    soTien = json['soTien'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ngayDong'] = this.ngayDong;
    data['soTien'] = this.soTien;
    return data;
  }
}