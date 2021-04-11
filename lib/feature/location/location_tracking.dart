class LocationTracking{
  int id;
  int idNhanVien;
  double kinhdo;
  double vido;
  String thoigian;


  LocationTracking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idNhanVien = json['idNhanVien'];
    kinhdo = json['kinhdo'];
    vido = json['vido'];
    thoigian = json['thoigian'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idNhanVien'] = this.idNhanVien;
    data['kinhdo'] = this.kinhdo;
    data['vido'] = this.vido;
    data['thoigian'] = this.thoigian;
    return data;
  }
}