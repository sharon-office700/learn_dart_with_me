import 'dart:ffi';

void main() {
  var some_string = "thr type here is infered by dart";
  String another_string = "unless you specify the type like this";

  var total_runs = 100;  // type is infered here 
  int current_run = 23;
  double run_rate = 2.23;  // float doesn't exist here in dart

  const double pi = 3.14;  // use const for constants at compile time like pi which won't change
  // const pi = 3.14; this will also do 

  final now = DateTime.timestamp();  // use this for constants you will find out at run time, like for when the code run at that run -time i want to save a constant OR a value which i will be fetching from another API 
  print(now.timeZoneName);

  dynamic dynamic_something = "if you haven\'t decided on the data type use dynamic, doesn\'t seems to be used that often actually ";
}