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

}