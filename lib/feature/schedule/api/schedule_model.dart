class ScheduleSwagger {
  bool success;
  int statusCode;
  Null meta;
  List<ScheduleResponse> data;
  Null message;

  ScheduleSwagger(
      {this.success, this.statusCode, this.meta, this.data, this.message});

  ScheduleSwagger.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    meta = json['meta'];
    if (json['data'] != null) {
      data = new List<ScheduleResponse>();
      json['data'].forEach((v) {
        data.add(new ScheduleResponse.fromJson(v));
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

class ScheduleResponse {
  int id;
  String ngay;
  int idTietHoc;
  int idMonHoc;
  int idLopHoc;
  int idGiaoVien;
  GiaoVien giaoVien;
  LopHoc lopHoc;
  Null monHoc;
  TietHoc tietHoc;

  ScheduleResponse(
      {this.id,
        this.ngay,
        this.idTietHoc,
        this.idMonHoc,
        this.idLopHoc,
        this.idGiaoVien,
        this.giaoVien,
        this.lopHoc,
        this.monHoc,
        this.tietHoc});

  ScheduleResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ngay = json['ngay'];
    idTietHoc = json['idTietHoc'];
    idMonHoc = json['idMonHoc'];
    idLopHoc = json['idLopHoc'];
    idGiaoVien = json['idGiaoVien'];
    giaoVien = json['GiaoVien'] != null
        ? new GiaoVien.fromJson(json['GiaoVien'])
        : null;
    lopHoc =
    json['LopHoc'] != null ? new LopHoc.fromJson(json['LopHoc']) : null;
    monHoc = json['MonHoc'];
    tietHoc =
    json['TietHoc'] != null ? new TietHoc.fromJson(json['TietHoc']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ngay'] = this.ngay;
    data['idTietHoc'] = this.idTietHoc;
    data['idMonHoc'] = this.idMonHoc;
    data['idLopHoc'] = this.idLopHoc;
    data['idGiaoVien'] = this.idGiaoVien;
    if (this.giaoVien != null) {
      data['GiaoVien'] = this.giaoVien.toJson();
    }
    if (this.lopHoc != null) {
      data['LopHoc'] = this.lopHoc.toJson();
    }
    data['MonHoc'] = this.monHoc;
    if (this.tietHoc != null) {
      data['TietHoc'] = this.tietHoc.toJson();
    }
    return data;
  }
}

class GiaoVien {
  int id;
  String maNV;
  String tenNV;
  String ngaySinh;
  String canCuocCongDan;
  String quocTich;
  String email;
  int gioiTinh;
  String tinhTrangHonNhan;
  String soDienThoai;
  Null avatar;
  String diaChi;
  int idTrangThai;
  int idBangCap;
  int idPhongBan;
  int idChucVu;
  String ngayVaoLam;
  bool dongBH;
  String ngayDongBH;
  int kyHanDongBH;
  int soNguoiPhuThuoc;

  GiaoVien(
      {this.id,
        this.maNV,
        this.tenNV,
        this.ngaySinh,
        this.canCuocCongDan,
        this.quocTich,
        this.email,
        this.gioiTinh,
        this.tinhTrangHonNhan,
        this.soDienThoai,
        this.avatar,
        this.diaChi,
        this.idTrangThai,
        this.idBangCap,
        this.idPhongBan,
        this.idChucVu,
        this.ngayVaoLam,
        this.dongBH,
        this.ngayDongBH,
        this.kyHanDongBH,
        this.soNguoiPhuThuoc});

  GiaoVien.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    maNV = json['maNV'];
    tenNV = json['tenNV'];
    ngaySinh = json['ngaySinh'];
    canCuocCongDan = json['canCuocCongDan'];
    quocTich = json['quocTich'];
    email = json['email'];
    gioiTinh = json['gioiTinh'];
    tinhTrangHonNhan = json['tinhTrangHonNhan'];
    soDienThoai = json['soDienThoai'];
    avatar = json['avatar'];
    diaChi = json['diaChi'];
    idTrangThai = json['idTrangThai'];
    idBangCap = json['idBangCap'];
    idPhongBan = json['idPhongBan'];
    idChucVu = json['idChucVu'];
    ngayVaoLam = json['ngayVaoLam'];
    dongBH = json['dongBH'];
    ngayDongBH = json['ngayDongBH'];
    kyHanDongBH = json['kyHanDongBH'];
    soNguoiPhuThuoc = json['soNguoiPhuThuoc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['maNV'] = this.maNV;
    data['tenNV'] = this.tenNV;
    data['ngaySinh'] = this.ngaySinh;
    data['canCuocCongDan'] = this.canCuocCongDan;
    data['quocTich'] = this.quocTich;
    data['email'] = this.email;
    data['gioiTinh'] = this.gioiTinh;
    data['tinhTrangHonNhan'] = this.tinhTrangHonNhan;
    data['soDienThoai'] = this.soDienThoai;
    data['avatar'] = this.avatar;
    data['diaChi'] = this.diaChi;
    data['idTrangThai'] = this.idTrangThai;
    data['idBangCap'] = this.idBangCap;
    data['idPhongBan'] = this.idPhongBan;
    data['idChucVu'] = this.idChucVu;
    data['ngayVaoLam'] = this.ngayVaoLam;
    data['dongBH'] = this.dongBH;
    data['ngayDongBH'] = this.ngayDongBH;
    data['kyHanDongBH'] = this.kyHanDongBH;
    data['soNguoiPhuThuoc'] = this.soNguoiPhuThuoc;
    return data;
  }
}

class LopHoc {
  int id;
  String tenLopHoc;
  String namHoc;
  int hocPhi;
  int idCoSo;
  int idGiaoVienChuNhiem;
  int idKhoaHoc;
  String ngayBatDau;
  String ngayKetThuc;

  LopHoc(
      {this.id,
        this.tenLopHoc,
        this.namHoc,
        this.hocPhi,
        this.idCoSo,
        this.idGiaoVienChuNhiem,
        this.idKhoaHoc,
        this.ngayBatDau,
        this.ngayKetThuc});

  LopHoc.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenLopHoc = json['tenLopHoc'];
    namHoc = json['namHoc'];
    hocPhi = json['hocPhi'];
    idCoSo = json['idCoSo'];
    idGiaoVienChuNhiem = json['idGiaoVienChuNhiem'];
    idKhoaHoc = json['idKhoaHoc'];
    ngayBatDau = json['ngayBatDau'];
    ngayKetThuc = json['ngayKetThuc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tenLopHoc'] = this.tenLopHoc;
    data['namHoc'] = this.namHoc;
    data['hocPhi'] = this.hocPhi;
    data['idCoSo'] = this.idCoSo;
    data['idGiaoVienChuNhiem'] = this.idGiaoVienChuNhiem;
    data['idKhoaHoc'] = this.idKhoaHoc;
    data['ngayBatDau'] = this.ngayBatDau;
    data['ngayKetThuc'] = this.ngayKetThuc;
    return data;
  }
}

class TietHoc {
  int id;
  String tenTietHoc;
  String thoiGianBatDau;
  String thoiGianKetThuc;

  TietHoc(
      {this.id, this.tenTietHoc, this.thoiGianBatDau, this.thoiGianKetThuc});

  TietHoc.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenTietHoc = json['tenTietHoc'];
    thoiGianBatDau = json['thoiGianBatDau'];
    thoiGianKetThuc = json['thoiGianKetThuc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tenTietHoc'] = this.tenTietHoc;
    data['thoiGianBatDau'] = this.thoiGianBatDau;
    data['thoiGianKetThuc'] = this.thoiGianKetThuc;
    return data;
  }
}