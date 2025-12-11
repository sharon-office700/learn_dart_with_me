// Future<String> str_return() async {
//   var hold = await another_func();
//   return hold;
// } 

// Future<String> another_func() => Future.delayed(const Duration(seconds: 2), () => "string returned from asynce function ");

// Future<void> main() async {
//   print("this is before async function call ");
//   print(await str_return());
//   print("this is after async function call ");
// }


// Future<void> printOrderMessage() async {
// //   print('Awaiting user order...');
//   print('Awaiting user order...');
//   var order = await fetchUserOrder();
//   print('Your order is: $order');
// }

// Future<String> fetchUserOrder() {
//   // Imagine that this function is more complex and slow.
//   return Future.delayed(const Duration(seconds: 4), () => 'Large Latte');
// }

// void main() async {
//   // print("print first");
//   countSeconds(4);
//   await printOrderMessage();
//   // print("print second");
// }

// // You can ignore this function - it's here to visualize delay time in this example.
// void countSeconds(int s) {
//   for (var i = 1; i <= s; i++) {
//     Future.delayed(Duration(seconds: i), () => print(i));
//   }
// }

// async k liye return type mention nhi kiya toh dart automatically usse Future mein erap karke de dega , for example async_func() => "some string" ka return type string ko wrap karke Future<string> kar dega agar explicitly String mention kiya hai and return kuch aur kiya toh conflict mein error throw hoga

import 'future_tut.dart';

return_string() async {
  print("print from return_str function ");
  print(await one_more_func());
  // var some_more = await int_return();
  print("\n🟠 this will take 2 seconds as this is 'awaiting' for the response form function int_return : 🟠  ${await int_return()}\n ");
  var some_val = await another_function();
  print("print from return_str function <=== this will print after line 45 as everything will run syncronously until the first await ");
  return some_val;  //dart ko agar bola nhi ki async function ka return type kya hai toh vo usse apne aap Future<T> , where T = actual type hai , Future mein wrap kar deta hai, bcoz agar tum some_val pe hover karoge toh uska type dynamic hoga(any , interface from golang) and dynamic can be anything 
}

another_function() => Future.delayed(const Duration(seconds: 4), () => "after 4 seconds - from event loop");

one_more_func() => "\n this arrow function 🩵 will print as fast as it can even though await hai bcoz yaha pe Future delayed ya koi aise cheez nahi hai jisse ye event loop mein add ho sake \n";

Future<int> int_return() async {
  return Future.delayed(const Duration(seconds: 2), () => 33);
}

void main() async {
  print("first print statement");
  for (var i = 0; i < 4; i++) {
    Future.delayed(Duration(seconds: i), () => print("these values are coming out of event loop: $i"));
  }
  print(await return_string());
}