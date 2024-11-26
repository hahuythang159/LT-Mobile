import 'dienthoai.dart';

class Hoadon {
  String _maHD;
  DateTime _ngayBan;
  Dienthoai _dienThoai;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKH;
  String _sdt;

  //Constructor
  Hoadon(this._maHD, this._ngayBan, this._dienThoai, this._soLuongMua,
      this._giaBanThucTe, this._tenKH, this._sdt);

  //Getters
  String get maHD => _maHD;
  DateTime get ngayBan => _ngayBan;
  Dienthoai get dienThoai => _dienThoai;
  int get soLuongMua => _soLuongMua;
  double get giaBanThucTe => _giaBanThucTe;
  String get tenKH => _tenKH;
  String get sdt => _sdt;

  //Setters;
  set maHD(String maHD) {
    if (maHD.isNotEmpty) {
      _maHD = maHD;
    }
    if (RegExp(r"^HD-\d{3}$").hasMatch(maHD)) {
      _maHD = maHD;
    }
  }

  set ngayBan(DateTime ngayBan) {
    if (ngayBan.isBefore(DateTime.now())) {
      _ngayBan = ngayBan;
    }
  }

  set dienThoai(Dienthoai dienThoai) {
    if (dienThoai == null) {
      throw Exception("Điện thoại không thể là null");
    }
    _dienThoai = dienThoai;
  }

  set soLuongMua(int soLuongMua) {
    if (soLuongMua <= 0) {
      throw Exception("Số lượng mua phải lớn hơn 0");
    }
    if (soLuongMua > _dienThoai.soLuongTonKho) {
      throw Exception("Số lượng mua không thể vượt quá số lượng tồn kho");
    }
    _soLuongMua = soLuongMua;
  }

  set giaBanThucTe(double giaBanThucTe) {
    if (giaBanThucTe > 0) {
      _giaBanThucTe = giaBanThucTe;
    }
  }

  set tenKH(String tenKH) {
    if (tenKH.isEmpty) {
      throw Exception("Tên khách hàng không được để trống");
    }
    _tenKH = tenKH;
  }

  set sdt(String sdt) {
    if (sdt.isEmpty) {
      throw Exception("Số điện thoại khách không được để trống");
    }
    if (!RegExp(r"^\d{10}$").hasMatch(sdt)) {
      throw Exception("Số điện thoại khách phải có 10 chữ số");
    }
    _sdt = sdt;
  }

  //Tính tổng tiền
  double tinhTongTien() {
    return _giaBanThucTe * _soLuongMua;
  }

  //Tính lợi nhuận
  double tinhLoiNhuan() {
    double giaNhap = dienThoai.giaNhap;
    return (_giaBanThucTe - giaNhap);
  }

  // Thông tin hoá đơn
  void hienThiThongTinHoaDon() {
    print("Mã hóa đơn: $_maHD");
    print("Ngày bán: $_ngayBan");
    print("Tên khách hàng: $_tenKH");
    print("Số điện thoại khách: $_sdt");
    print("Điện thoại bán: ${_dienThoai.tenDT}");
    print("Số lượng mua: $_soLuongMua");
    print("Giá bán thực tế: $_giaBanThucTe");
    print("Tổng tiền: ${tinhTongTien()}");
    print("Lợi nhuận thực tế: ${tinhLoiNhuan()}");
  }
}
