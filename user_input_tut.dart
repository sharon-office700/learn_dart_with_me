import "dart:io";

void main() {
  print("please enter your name: ");
  // var name = stdin.readLineSync();
  // String name = stdin.readLineSync();  <= this will cause error as user can input nothing leading it to null and dart makes a big deal about null values and that's why user inputs are considered a have propability of null values so the correct way of doing this is ...

  String? name = stdin.readLineSync();

  print("input name is : $name");
}