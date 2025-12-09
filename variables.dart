
late var outsideMain;

void main() {
  
  // cannot be null or else will cause run time error
  var inferred = 'this string\'s type is inferred by dart';
  String specific = 'I\'ve specified the data type for this string, (recommended)';
  Object objectVariable = 'object variable yet to discover';

  // can take null values
  String? nullable = 'This string can become null';

  // print(inferred + specific  + nullable);
  // print(objectVariable);

  var nonInitializedVar;
  print(nonInitializedVar); // prints null bcoz i used var which inferred the data type to null as i have not initialized the variable yet

  String sampleStr;
  //   print(sampleStr);  
  //   The non-nullable local variable 'sampleStr' must be assigned before it can be used.
  // Try giving it an initializer expression, or ensure that it's assigned on every execution path

  sampleStr = nullable;
  print(sampleStr);  // outputs : This string can become null


  String sample2;
  // print(sample2);  this will throw error , hence  ...
  sample2 = '';
  print('***' + sample2 + '***');  // output: ******

  int some_int;
  some_int = 12;
  // print('printing some interger value here : ' + some_int); -> yaha pe error throw hoga bcoz dart ek strongly typed language hai , pehle value string hai toh next bhi string expect karta hai 

  print('printing using the .toString() method'+ some_int.toString()); //lekin ye tareeka thoda jyafa over the top hai 

  print('print using the recommended string interpolation method: $some_int') ;
  // is python k f string k tarah hai , e.g; f"the is the string : {value}"
  // bas farak ye hai ki values inject jaha kar raha ho usko $ ke saath use karo instead of curly braces

  outsideMain = 12;
  print('outsideMain:  $outsideMain');

  // koi variables use nhi karna ho ya ignore karna hai toh _ mein daal sakte ho just like golang
  var _ = 'something wierd here ';
  String _ = 'even more wierd'; 

  for (var _ in [1,2,4,5]) {
    print('we are ignoring the item and printing ');
  }

  var _ = 'something';  // these 2 will be ignore 
  int _ = 12;

  var _ = do_something();  // if you want to perform an action via a function and don't want the return value than you can use
  // wenn du brauche einen action durfurhen von ein function aber magst die value nicht, dan verwenden sie das _ , das willst ignore die output von der function 
}


int do_something() {
  print('performed some action and returned an int');
  return 33;
}