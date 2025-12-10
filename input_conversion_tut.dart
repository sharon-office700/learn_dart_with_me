import 'dart:io';

void main() {
  print("please enter a number: ");

  var user_inp = stdin.readLineSync();
  var return_val = int.parse(user_inp ?? '0');
  print(return_val * 1000);

}