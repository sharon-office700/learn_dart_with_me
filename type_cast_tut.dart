void main() {
  // string to int
  int a = int.parse("10");

  // string to double
  double b = double.parse("10");
  print("this will add .0 to the int/string if need be like : $b");

  // int to string
  String c = 10.toString();

  // double to string
  String d = 10.98.toString();

  // int to double
  double dd = 10.toDouble();
  print("converted int to double: $dd");

  // doubel to int
  int ii = 98.009.toInt();
  print("converted double to int : $ii");

  int ii2 = 99.999.toInt();
  print("approximation doesn't happend 99.999 will become $ii2 not 100");
}