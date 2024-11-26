class Dienthoai {
  String _maDT;
  String _tenDT;
  String _hangSX;
  double _giaNhap;
  double _giaBan;
  int _soLuongTonKho;
  bool _trangThai;

  //Constructor
  Dienthoai(this._maDT, this._tenDT, this._hangSX, this._giaNhap, this._giaBan,
      this._soLuongTonKho, this._trangThai);

  //Getters
  String get maDT => _maDT;
  String get tenDT => _tenDT;
  String get hangSX => _hangSX;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get soLuongTonKho => _soLuongTonKho;
  bool get trangThai => _trangThai;

  //Setters
  set maDT(String maDT) {
    if (maDT.isNotEmpty) {
      _maDT = maDT;
    }
    if (RegExp(r"^HD-\d{3}$").hasMatch(maDT)) {
      _maDT = maDT;
    }
  }

  set tenDT(String tenDT) {
    if (tenDT.isNotEmpty) {
      tenDT = tenDT;
    }
  }

  set hangSX(String hangSX) {
    if (hangSX.isNotEmpty) {
      hangSX = hangSX;
    }
  }

  set giaNhap(double giaNhap) {
    if (giaNhap > 0 && giaNhap < giaBan) {
      _giaNhap = giaNhap;
    }
  }

  set giaBan(double giaBan) {
    if (giaBan > 0 && giaBan > giaNhap) {
      _giaBan = giaBan;
    }
  }

  set soLuongTonKho(int soLuongTonKho) {
    if (soLuongTonKho >= 0) {
      _soLuongTonKho = soLuongTonKho;
    }
  }

  set trangThai(bool trangThai) {
    _trangThai = trangThai;
  }

  //Tinh loi nhuan
  double tinhLoiNhuan() {
    return (_giaBan - _giaNhap) * _soLuongTonKho;
  }

  //Hien thi thong tin cua dien thoai
  void hienThiThongTinDienThoai() {
    print('Mã Điện thoại: $_maDT');
    print('Tên điện thoại: $_tenDT');
    print('Hãng sản xuất: $_hangSX');
    print('Giá nhập: $_giaNhap');
    print('Giá bán: $_giaBan');
    print('Số lượng tồn kho: $_soLuongTonKho');
    print("Trạng thái: ${_trangThai ? 'Còn hàng' : 'Không còn hàng'}");
  }

  //Kiểm tra còn bán không
  bool conBanKhong() {
    return _soLuongTonKho > 0 && _trangThai;
  }
}
