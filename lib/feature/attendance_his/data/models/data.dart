class AttendanceHistory {
  int id;
  int idNhanVien;
  String ngayGioChamCong;
  double nhietDo;
  int idCaLamViec;
  int idPhuongThucChamCong;
  String imageData;

  AttendanceHistory(
      {this.id,
        this.idNhanVien,
        this.ngayGioChamCong,
        this.nhietDo,
        this.idCaLamViec,
        this.idPhuongThucChamCong,
        this.imageData});

  AttendanceHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idNhanVien = json['idNhanVien'];
    ngayGioChamCong = json['ngayGioChamCong'];
    nhietDo = json['nhietDo'];
    idCaLamViec = json['idCaLamViec'];
    idPhuongThucChamCong = json['idPhuongThucChamCong'];
    imageData = json['imageData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idNhanVien'] = this.idNhanVien;
    data['ngayGioChamCong'] = this.ngayGioChamCong;
    data['nhietDo'] = this.nhietDo;
    data['idCaLamViec'] = this.idCaLamViec;
    data['idPhuongThucChamCong'] = this.idPhuongThucChamCong;
    data['imageData'] = this.imageData;
    return data;
  }
}