import '../models/dienthoai.dart';
import '../models/hoadon.dart';
import '../models/cuaHang.dart';

void main() {
  // Khởi tạo đối tượng cửa hàng
  var cuaHang = Cuahang("Cửa Hàng Apple", "123 Đường Lê Lợi, TP.HCM");

  // 1. Tạo và quản lý thông tin điện thoại
  var dienThoai1 = Dienthoai(
      'MaDT001', 'Iphone 16 Pro Max', 'Apple', 15000000, 20000000, 5, true);
  var dienThoai2 = Dienthoai(
      'MaDT002', 'Iphone 14 Pro', 'Apple', 12000000, 16000000, 10, true);

  // Thêm điện thoại mới vào cửa hàng
  cuaHang.themDienThoai(dienThoai1);
  cuaHang.themDienThoai(dienThoai2);

  // Hiển thị thông tin điện thoại
  print('Thông tin các điện thoại trong cửa hàng:');
  cuaHang.hienThiDanhSachDienThoai();
  print('-------------------------------------');

  // Cập nhật thông tin điện thoại
  print('Cập nhật thông tin điện thoại MaDT001:');
  cuaHang.capNhatThongTinDienThoai(
      'MaDT001', 'Iphone 16 Pro Max', 'Apple', 14500000, 19500000, 2, 2, true);
  cuaHang.hienThiDanhSachDienThoai();
  print('-------------------------------------');

  // Kiểm tra điện thoại có thể bán không (kiểm tra tồn kho và trạng thái)
  print('Kiểm tra điện thoại MaDT001 có thể bán không:');
  print("Có thể bán không: ${dienThoai1.conBanKhong()}");
  print('-------------------------------------');

  // Ngừng kinh doanh điện thoại
  print('Ngừng kinh doanh điện thoại MaDT002:');
  cuaHang.ngungKinhDoanhDienThoai('MaDT002');
  cuaHang.hienThiDanhSachDienThoai();
  print('-------------------------------------');

  // 2. Tạo và quản lý hóa đơn
  var hoaDon1 = Hoadon('HD01', DateTime.now(), dienThoai1, 2, 18000000,
      'Nguyễn Văn A', '0333678403');
  var hoaDon2 = Hoadon('HD02', DateTime.now(), dienThoai1, 1, 19000000,
      'Trần Thị B', '0912345678');
  var hoaDon3 = Hoadon('HD03', DateTime.now(), dienThoai2, 3, 17000000,
      'Lê Văn C', '0922334455');

  // Tạo hóa đơn mới
  cuaHang.taoHoaDon('HD01', DateTime.now(), dienThoai1, 2, 18000000,
      'Nguyễn Văn A', '0333678403');
  cuaHang.taoHoaDon('HD02', DateTime.now(), dienThoai1, 1, 19000000,
      'Trần Thị B', '0912345678');
  cuaHang.taoHoaDon('HD03', DateTime.now(), dienThoai2, 3, 17000000, 'Lê Văn C',
      '0922334455');

  // Hiển thị thông tin hóa đơn
  print('Thông tin các hóa đơn:');
  cuaHang.hienThiDanhSachHoaDon();
  print('-------------------------------------');

  // 3. Kiểm tra các ràng buộc trong việc tạo hóa đơn
  print('Kiểm tra tạo hóa đơn với số lượng vượt quá tồn kho:');
  cuaHang.taoHoaDon('HD04', DateTime.now(), dienThoai1, 6, 18000000,
      'Nguyễn Thị D', '0933344556');
  print('-------------------------------------');

  print('Kiểm tra tạo hóa đơn khi điện thoại ngừng kinh doanh:');
  cuaHang.taoHoaDon('HD05', DateTime.now(), dienThoai2, 2, 16000000,
      'Phan Văn E', '0955667788');
  print('-------------------------------------');

  // 4. Tính toán tiền và lợi nhuận
  print('Tính toán tổng tiền và lợi nhuận của hóa đơn HD01:');
  hoaDon1.hienThiThongTinHoaDon();
  print("Tổng tiền: ${hoaDon1.tinhTongTien()}");
  print("Lợi nhuận: ${hoaDon1.tinhLoiNhuan()}");
  print('-------------------------------------');

  // 5. Thống kê báo cáo
  print('Thống kê doanh thu từ 01/01/2024 đến 31/12/2024:');
  DateTime tuNgay = DateTime(2024, 1, 1);
  DateTime denNgay = DateTime(2024, 12, 31);
  print("Tổng doanh thu: ${cuaHang.tinhTongDoanhThu(tuNgay, denNgay)}");
  print('-------------------------------------');

  print('Thống kê lợi nhuận từ 01/01/2024 đến 31/12/2024:');
  print("Tổng lợi nhuận: ${cuaHang.tinhTongLoiNhuan(tuNgay, denNgay)}");
  print('-------------------------------------');

  print('Thống kê top điện thoại bán chạy:');
  cuaHang.thongKeTopDienThoaiBanChay();
  print('-------------------------------------');

  print('Thống kê tồn kho hiện tại:');
  cuaHang.thongKeTonKho();
  print('-------------------------------------');
}
