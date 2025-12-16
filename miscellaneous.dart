void main() {
  var func1 = () => print("something");
  var func = () => "something";

  print("func1: ");
  print("\${func1().runtimeType} <----- this won\'t work as it is returning void\n \${func1.runtimeType} ==> ${func1.runtimeType}\n \${func1} ==> ${func1}\n \${func1()} <-- this won't work as it is returning void");

  print("\n\n");

  print("func: ");
  print("\${func().runtimeType} ==> ${func().runtimeType} <----- this work as it is returning NOT void\n \${func.runtimeType} ==> ${func.runtimeType}\n \${func} ==> ${func}\n \${func()} ==> ${func()} <-- this work as it is returning void");  

}