void main() {
  var my_map = {1:"sharon", 2: "akhil"};
  // accessing elements
  my_map[1];

  // add elements
  my_map.addAll({5: "golang", 6: "python"});
  print("adding new key-val pairs in map: $my_map by using addAll method");

  //replace values 
  my_map[1] = "maneesh sir";
  print("$my_map == replaced sharon value at key 0");

  // remove values
  my_map.remove(0);
  print("removed item with key 0 $my_map");

  my_map.clear();
  print("use the clear method to empty this stuff: $my_map");


  // my_map.clear(); clears the map altogether
}