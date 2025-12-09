void main() {
  inside_func() {
    print("print from inside_func");
  }

  inside_func();
  outside_func();
  print(return_function());

  var some_var = return_function(); //storing the return value in a variable
  print("printing the variable where the return value is being stored: ${some_var}");

  print(function_with_paramters("first string param", "second string param", 2));

  // print(function_with_paramters("a", "b")); // this will throw error as the number of arguments != no of parameters

  print(optional_parameter("john") + " ============ " + optional_parameter("john", "some parameter"));

  print("calling named_parameters() with one parameters and 2nd is set to default value : ${named_parameters("sharon")}");
  print("calling named_parameters() with both parameters and it will override the default one: ${named_parameters("sharon", b: "bhosle")}");


}

outside_func() {
  print("print from outside func ...");
}

return_function() {
  return "this is a return statement ${1+1}";
}

function_with_paramters(String a, b, int c) {
  return "the passed strings are::  $a, $b and the integer is $c";
}

// String? random_var;
// // since this value can be null that's why if any method needs to be used it has to be like this
// var in_line = () => {
//   print(random_var?.isEmpty)
// };

// var in_line2 = () => {
//   print(random_var!.isEmpty)  // this is a null-check 
// };


optional_parameter(String a, [b]) {
  print("optional parameters are parameters if you didn't pass it will print null, u have to place them inside [] in function defination though");
  print("if b is passed it will show it's value else will print null ");
  
  return "this is $a and $b";
}


named_parameters(String a, {b ="default"}) {
  return "1st parameter == $a , 2nd parameter == $b";
}


