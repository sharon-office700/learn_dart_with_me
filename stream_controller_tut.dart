import 'dart:async';

Stream<int> counter_with_error_and_continue(int nums) {
  // 1. StreamController बनाएं
  final controller = StreamController<int>();

  void generate() async {
    for (var i = 1; i <= nums; i++) {
      // 50ms का delay डालें ताकि Asynchronous execution स्पष्ट हो
      await Future.delayed(Duration(milliseconds: 50), () => print("printing from the future block here +++++++")); 

      if (i == 4) {
        // 2. error भेजें (Stream को बंद किए बिना)
        controller.addError(
          TimeoutException('Custom Error: Value 4 is forbidden!'),
          StackTrace.current,
        );
        // Error भेजने के बाद loop को जारी रखें
        continue; 
      }
      
      // 3. Data भेजें
      controller.add(i);
    }
    
    // 4. जब loop खत्म हो जाए, तो Stream को बंद कर दें
    controller.close();
  }

  // Generation process शुरू करें
  generate();

  // Controller के Stream को return करें
  return controller.stream;
}

void main() async {
  print('--- Stream Execution Start (Error, then Continue) ---');
  
  // StreamController से बना Stream डिफ़ॉल्ट रूप से Single Subscription होता है।
  // दो Listeners के लिए इसे Broadcast बनाना ज़रूरी है।
  var myStream = counter_with_error_and_continue(6).asBroadcastStream();

  // Subscription 1
  myStream.listen(
    (onData) => print("Sub 1 Recieving data: $onData"),
    onError: (error) => print("\nSub 1 ⚠️ ENCOUNTERED err: $error\n"), 
    onDone: () => print("Sub 1: Done"),
    // 5. cancelOnError: false सेट करें ताकि error के बाद Listener बंद न हो
    cancelOnError: false, 
  );

  // Subscription 2
  myStream.listen(
    (onData) => print("Sub 2 Recieving data: $onData"),
    onError: (error) => print("\nSub 2 ❌ ENCOUNTERED err: $error\n"), 
    onDone: () => print("Sub 2: Done"),
    cancelOnError: false,
  );
}


/*

chahe tum async* use karke streams bhejo ya stream controller ka use karo 

and input recieve karne k liye tum listen bhi kar sakte ho and "await for" ko use karke bhi input le sakte ho

// async* use kiya toh stream controller use karne ki zaroorat nahi hai , async* se kaam ho jaayga but dhyaan rahe async* se value tum ek generator se bhejoge and use generator mein koi error/Excepiton throw hua toh generator band ho jaata hai even though tum use catch karke handle kar lo 

tumhara try-catch block synchronous code ka error handle kar sakta hai agar asynchronous data ka error and exception handle karna hai toh .listen() ki tarah .onError() method use karo and .cancelOnError property ko "false"  kar do toh <--- ye by default true rehta hai, 
isko false kiya toh stream error k baad bhi data bhejega and cancel nhi hoga

*/