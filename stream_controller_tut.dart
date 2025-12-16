import 'dart:async';

Stream<int> counter_with_error_and_continue(int nums) {
  // 1. StreamController बनाएं
  final controller = StreamController<int>();

  void generate() async {
    for (var i = 1; i <= nums; i++) {
      // 50ms का delay डालें ताकि Asynchronous execution स्पष्ट हो
      await Future.delayed(Duration(milliseconds: 50)); 

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