import 'dart:io';
import 'dart:math';

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

  int sum = 0;

  for (int i = 1; i <= n; i++) {
    if (n % i == 0) {
      sum += i;
    }
  }

  print("Tổng các ước số của $n là: $sum");
}
