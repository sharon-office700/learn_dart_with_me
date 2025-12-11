
// the Future<T> instance produce a value of T i.e Future<int> gives int
// right now it is given nothing so it gives Future<void> => void, 
Future<void> first_func() {
  return Future.delayed(const Duration(seconds: 2), () => print("this future returns void"));
}


Future<int> second_func() => 
  Future.delayed(const Duration(seconds: 2), () => 20);

Future<int> some = second_func();


void main() {
  print("======= ${first_func()}");
  print("======= ${second_func()}"); //u  r getting Future<int> in bcoz the you are trying to return a int instead of Future<int> , this can be cleared by using saync and await keyword in thr async_await_tut.dart file
  print(some);
  print("this is from the main function ");
}

