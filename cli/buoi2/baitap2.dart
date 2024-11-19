import 'dart:io';

void main() {
  int n;
  do {
    print("Nhập vào một số nguyên (n >= 1): ");
    String? input = stdin.readLineSync();
    if (input != null) {
      n = int.tryParse(input) ?? 0;
    } else {
      n = 0;
    }
    if (n < 1) {
      print("Giá trị n phải lớn hơn hoặc bằng 1, vui lòng nhập lại!");
    }
  } while (n < 1);

  String binary = "";

  while (n > 0) {
    int remainder = n % 2;
    binary = remainder.toString() + binary;
    n = n ~/ 2;
  }

  print("Số nhị phân tương ứng là: $binary");
}
