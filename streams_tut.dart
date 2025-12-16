// import 'dart:async';

// Stream<int> counterFunction(int input) async* {
//   await Future.delayed(const Duration(milliseconds: 50)); 
  
//   print('Stream started...');

//   for (var i = 0; i < input; i++) {
//     await Future.delayed(const Duration(milliseconds: 10)); 
    
//     if (i == 4) {
//       print('Throwing error at i = 4...');
//       // ✅ CORRECTED: Use RangeError.index for index-related errors
//       // RangeError.index(invalidValue, indexable, name, message, length)
//       throw RangeError.index(
//         i, // invalidValue (the index that is bad)
//         'i', // name (name of the value that is bad)
//         'The count reached 4 and an error was intentionally thrown.' // message
//       );
//     }
    
//     yield i;
//   }
//   print('Stream finished.');
// }

// void main() async {
//   print('Subscribing to stream...');
  
//   try {
//     await for (var count in counterFunction(10)) {
//       print('Received value: $count');
//     }
//   } catch (e, s) {
//     print('\n--- Stream Error Caught ---');
//     print('Error Type: ${e.runtimeType}');
//     print('Error Message: $e');
    
//     print('\n--- Stack Trace ---');
//     print(s);
//     print('---------------------------\n');
//   }
// }

import 'dart:async';

Stream<int> counter_function(item) async* {
  await Future.delayed(Duration(microseconds: 50));

  try {
    for (var i = 0; i < item; i++) {
      if (i == 4) {
        print("throwing error now :");
    
        throw TypeError();
        
      }
      yield i;
    }
  } on TypeError catch (e) {
    // TODO
    print("catched the $e here");
    // yield* TypeError.hashCode;
  } on Exception catch(ee) {
    print("In case koi aur exception fire hua: $ee");
  } finally {
    print("this is the finally vlock");
  }

  
  print("Stream finished");
}

void main() async {
  try {
    // await for (var count in counter_function(10)) {
    //   print("Recieved value from counter_function : $count");
    // }

    // var counter_reply = counter_function(10);
    // print(counter_reply.listen((onData) => print("$onData")));

    // counter_function(10).listen((onData) => print("this is data : $onData"), 
    // onError: (error) => print("\n On error this will be print \n"),
    // onDone: () => print("\nOn done this will be printed 🩵 🩵 🩵"),
    // cancelOnError: false);

  } catch (e) {
    print("\n ________________________");
    print("Printing the type of error here: ${e.runtimeType}");
    print("Printing the message here: $e");
    print("________________________\n");
  }
}