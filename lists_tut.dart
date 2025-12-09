void main() {
  var new_list = [1,2,3,4];
  List<int> int_list = [1,2,3,4];

  // new_list.clear() empty the list

  new_list.add(100); 
  new_list.add(100); // adds at the end of the list/array ; allows duplicates too 
  print("added 100 to the list $new_list");

  new_list.addAll([33,44,55,322]);
  print("use addAll list method to add more than one item at once, takes a makeshift list as input values: $new_list");

  var another_list = [];
  another_list.addAll([12,34]);
  another_list[0] = 0; // replace item at index
  another_list.insertAll(0, [21, 22, 23]); //"insert another item at some index and rest will shift to the right" as Iterable<dynamic>);
  print("$another_list == after adding a bunch of items at index 0 ");
  var var_list = [1,23, "sharon", false];
  print("a list can contain multiple data type in itself == $var_list");
}