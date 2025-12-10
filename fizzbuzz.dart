void main() {
  int i = 1;
  while (i <= 100) {

    // if (i % 5 == 0 && i % 3 == 0) {
    //   print("$i FIzzBuzz !");
    // } else if (i % 5 == 0) {
    //   print("$i Fizz");
    // } else if (i % 3 == 0) {
    //   print("$i Buzz");
    // } else {
    //   print("$i");
    // }


    // print((i%3 == 0) ? "Fizz" : (i%5==0) ? "Buzz": i);
    print((i%3 == 0 && i%5 == 0) ? "$i FizzBuzz!" : (i%3 == 0) ? "$i Fizz" : (i%5==0) ? "$i Buzz": i);
    i = i +1;

  }

  // print(5 > 4 ? "greater" : "lessser");
}