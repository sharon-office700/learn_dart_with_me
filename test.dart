void main() {
  Stream<int> streaming_numbers = Stream.periodic(const Duration(microseconds: 50), (count) => count*100).take(5);

  streaming_numbers.listen((onData) => print("printing from iterable $onData"));
}