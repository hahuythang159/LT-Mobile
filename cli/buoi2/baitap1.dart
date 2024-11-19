import 'dart:io';
import 'dart:math';

void main() {
  double a = 0, b = 0, c = 0;

  do {
    stdout.write('Nhap he so a (a khac 0): ');
    String? input = stdin.readLineSync();
    if (input != null) {
      a = double.tryParse(input) ?? 0;
    }
    if (a == 0) {
      print('Hệ số a phải khác không, vui lòng nhập lại!');
    }
  } while (a == 0);

  stdout.write('Nhap he so b: ');
  String? inputB = stdin.readLineSync();
  if (inputB != null) {
    b = double.tryParse(inputB) ?? 0;
  }

  stdout.write('Nhap he so c: ');
  String? inputC = stdin.readLineSync();
  if (inputC != null) {
    c = double.tryParse(inputC) ?? 0;
  }

  print('\nPhuong trinh: ${a}x^2 + ${b}x + $c = 0');

  double discriminant = b * b - 4 * a * c;

  if (discriminant > 0) {
    double root1 = (-b + sqrt(discriminant)) / (2 * a);
    double root2 = (-b - sqrt(discriminant)) / (2 * a);
    print('\n Phuong trinh co hai nghiem thuc: \n x1 = $root1,\n x2 = $root2');
  } else if (discriminant == 0) {
    double root = -b / (2 * a);
    print('\n Phuong trinh co mot nghiem thuc duy nhat: x = $root');
  } else {
    double realPart = -b / (2 * a);
    double imaginaryPart = sqrt(-discriminant) / (2 * a);
    print(
        '\n Phuong trinh vo nghiem: \n x1 = $realPart + ${imaginaryPart}i \n x2 = $realPart - ${imaginaryPart}i');
  }
}
