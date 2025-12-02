void main() { 
  print(2 == 2);  
  print(2 != 3);  
  print(3 > 2); 
  print(2 < 3); 
  print(3 >= 3);  
  print(2 <= 3);

  int a = 1;
  int b = 1;
  int c = a;

  print('${a == b} heir a und b value ist gleich zuinender, empphasis an value ist gleich');
  print('${a == c} heir a und c ist pointing zu der dasselbe memory addresse, somit dier value willst true');
  
  var aa = 2;
  var bb = 'string';
  print('${a is int} de a variable ist int oder nicht, fur die checking purpose "is" operator ist verwendern');
  print('similarly ${bb is! String} will return false');


//  || ist dei OR operator 
  // Object ist verwendern als die interface im golang, wenn immer wie hast ein object wo data type ist defined nicht dann wie verwendern object type und then wann the type ist fixed es ist converten zu die type wir brauchen 

  // fur example:
  Object obj = ' das obj variable ist von string type'; // var obj interface
  Object obj2 = 22;
  print('${obj is String} == es ist immer gut zu check die type vorher type casting oder wie erhalten error');

  print(obj as String);  // obj.(string)


  print('${obj2 is String} heir obj2 ist von int type aber es willst try zu converte es hinen string somit wir erhalten ein error');
  try {
    
    print('${obj2 as String}'); 
  } catch (e) {
    print('error caught heir: ${e}'); 
  }

  // && is verwendern als es ist verwendern im golang, also ist || und ! operator


  print(!false); // wie zu verwendere dei ! operator

  // hier im line 41 bbb kann sei null, somit die ?, der value von a ist assigned zu b nur wenn b ist nicht null, ansonsten wenn ist null dann dei value von a ist nicht assigned
  int? bbb;
  bbb ??= a;  // somit ist dei purpose von ??= operator

  print('${5 ~/ 2}  heir dei ouput ist ein int nummer weil von die ~/ operator');
  print('${5 / 2} heir ist dei normal division operator erhalts float output wann divide');

  // es ist ein line if-else oder conditoinal operator similar zu javascript und python
  // condition ? expression1 : expression2

// wenn dei isPublic expression ist true dei value am links ist assigned wenn false dann dei value am rechts ist assigned, heir der warning ist kommen weil deir compiler beriets wissen das the value ist true im line nummer 52
  bool isPublic = true; 
  var visiblity = isPublic ? 'pubic' : 'private';
  print(visiblity);

// same als javascript wir habe dei 'null coalesing' operator, wenn wir mochte zu check value ist null oder nien wir check es against dei ?? operator 
// heir another kann sei null wenn es ist 'something' string value will print ansosten another actual value will printen
  bool? another;
  print(another ?? 'something');

  // heir ist dei function machte dei dasselbe 
  String playerName(String? name) => name ?? 'guest_name';
  print('${playerName(null)} ==== weil the passed argument ist null output ist guest_name');
  print('${playerName('sharon')} ==== heir dei value ist nicht null somit dei output ist \'something\'');


  var foo = null;
  print('${foo?[1]} :::: ${foo?.bar} ::::> weir foo ist null somit accessing mit any way will result im null');

  /*

! <--	Not-null assertion operator 	Casts an expression to its underlying non-nullable type, throwing a runtime exception if the cast fails; example: foo!.bar asserts foo is non-null and selects the property bar , unless foo is null (in which case a runtime exception is thrown) 
  */
/// heir ist ein example fur documented comment, es kann auch include classname, methods, variables, object etc wann placed im dei [] bracket
/// [main] 
/// [playerName]
}

