import 'dienthoai.dart';
import 'hoadon.dart';

class Cuahang {
  String _tenCuaHang;
  String _diaChi;
  List<Dienthoai> _dsDienThoai = [];
  List<Hoadon> _dsHoaDon = [];

  //Constructor
  Cuahang(this._tenCuaHang, this._diaChi);

  //Getters
  String get tenCuaHang => _tenCuaHang;
  String get diaChi => _diaChi;
  List<Dienthoai> get dsDienThoai => _dsDienThoai;
  List<Hoadon> get dsHoaDon => _dsHoaDon;

  //Thêm điện thoại mới
  void themDienThoai(Dienthoai dt) {
    _dsDienThoai.add(dt);
    print("Thêm điện thoại thành công: ${dt.tenDT}");
  }

  // Cập nhật thông tin điện thoại (theo mã điện thoại)
  void capNhatThongTinDienThoai(
      String maDT,
      String tenDT,
      String hangSX,
      double giaNhap,
      double giaBan,
      int soLuong,
      int soLuongTonKho,
      bool trangThai) {
    for (var dt in _dsDienThoai) {
      if (dt.maDT == maDT) {
        dt.tenDT = tenDT;
        dt.hangSX = hangSX;
        dt.giaNhap = giaNhap;
        dt.giaBan = giaBan;
        dt.soLuongTonKho = soLuongTonKho;
        dt.trangThai = trangThai;
        print('\nCập nhật thông tin thành công');
        return;
      }
    }
    print("Không tìm thấy điện thoại với mã $maDT");
  }

  //Ngung kinh doanh dien thoai
  void ngungKinhDoanhDienThoai(String maDT) {
    for (var dt in _dsDienThoai) {
      if (dt.maDT == maDT) {
        dt.trangThai = false;
        print("Điện thoại ${dt.tenDT} đã ngừng kinh doanh.");
        return;
      }
    }
    print("Không tìm thấy điện thoại với mã $maDT");
  }

  // Tìm kiếm điện thoại (theo mã, tên, hãng)
  void timKiemDienThoai(String timKiemDT) {
    bool found = false;
    for (var dienThoai in _dsDienThoai) {
      if (dienThoai.maDT.contains(timKiemDT) ||
          dienThoai.tenDT.contains(timKiemDT)) {
        dienThoai.hienThiThongTinDienThoai();
        found = true;
      }
    }
    if (!found) {
      print("Không tìm thấy điện thoại nào với từ khóa '$timKiemDT'");
    }
  }

  // Hiển thị danh sách điện thoại
  void hienThiDanhSachDienThoai() {
    if (_dsDienThoai.isEmpty) {
      print("Danh sách điện thoại trống.");
    } else {
      for (var dienThoai in _dsDienThoai) {
        dienThoai.hienThiThongTinDienThoai();
        print("-----------------------------");
      }
    }
  }

  //Các phương thức quản lý hóa đơn

  //Tạo hoá đơn mới
  void taoHoaDon(String maHD, DateTime ngayBan, Dienthoai dt, int soLuongMua,
      double giaBanThucTe, String tenKH, String sdt) {
    if (!dt.conBanKhong()) {
      print("Điện thoại ${dt.tenDT} không còn bán.");
      return;
    }
    if (soLuongMua > dt.soLuongTonKho) {
      print("Số lượng mua vượt quá tồn kho.");
      return;
    }

    // Cập nhật tồn kho
    dt.soLuongTonKho -= soLuongMua;

    // Tạo hóa đơn mới
    var hoaDon =
        Hoadon(maHD, ngayBan, dt, soLuongMua, giaBanThucTe, tenKH, sdt);
    _dsHoaDon.add(hoaDon);
    print("Hóa đơn được tạo thành công!");
  }

  // Tìm kiếm hóa đơn (theo mã, ngày, khách hàng)
  void timKiemHoaDon(String timKiem) {
    bool found = false;
    for (var hoaDon in _dsHoaDon) {
      if (hoaDon.maHD.contains(timKiem) || hoaDon.tenKH.contains(timKiem)) {
        hoaDon.hienThiThongTinHoaDon();
        found = true;
      }
    }
    if (!found) {
      print("Không tìm thấy hóa đơn nào với từ khóa '$timKiem'");
    }
  }

  // Hiển thị danh sách hóa đơn
  void hienThiDanhSachHoaDon() {
    if (_dsHoaDon.isEmpty) {
      print("Danh sách hóa đơn trống.");
    } else {
      for (var hoaDon in _dsHoaDon) {
        hoaDon.hienThiThongTinHoaDon();
        print("-----------------------------");
      }
    }
  }

  //Các phương thức thống kê

  // Tính tổng doanh thu theo khoảng thời gian
  double tinhTongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    double tongDoanhThu = 0;
    for (var hoaDon in _dsHoaDon) {
      if (hoaDon.ngayBan.isAfter(tuNgay) && hoaDon.ngayBan.isBefore(denNgay)) {
        tongDoanhThu += hoaDon.tinhTongTien();
      }
    }
    return tongDoanhThu;
  }

  // Tính tổng lợi nhuận theo khoảng thời gian
  double tinhTongLoiNhuan(DateTime tuNgay, DateTime denNgay) {
    double tongLoiNhuan = 0;
    for (var hoaDon in _dsHoaDon) {
      if (hoaDon.ngayBan.isAfter(tuNgay) && hoaDon.ngayBan.isBefore(denNgay)) {
        tongLoiNhuan += hoaDon.tinhLoiNhuan();
      }
    }
    return tongLoiNhuan;
  }

  // Thống kê top điện thoại bán chạy (theo số lượng bán)
  void thongKeTopDienThoaiBanChay() {
    var danhSachDienThoaiBanChay = Map<String, int>();

    for (var hoaDon in _dsHoaDon) {
      var dt = hoaDon.dienThoai;
      if (danhSachDienThoaiBanChay.containsKey(dt.tenDT)) {
        danhSachDienThoaiBanChay[dt.tenDT] =
            danhSachDienThoaiBanChay[dt.tenDT]! + hoaDon.soLuongMua;
      } else {
        danhSachDienThoaiBanChay[dt.tenDT] = hoaDon.soLuongMua;
      }
    }

    var sortedList = danhSachDienThoaiBanChay.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    print("Top điện thoại bán chạy:");
    for (var entry in sortedList) {
      print("${entry.key}: ${entry.value} chiếc");
    }
  }

  // Thống kê tồn kho
  void thongKeTonKho() {
    print("Tồn kho hiện tại của các điện thoại:");
    for (var dt in _dsDienThoai) {
      print("${dt.tenDT}: ${dt.soLuongTonKho} chiếc");
    }
  }
}
