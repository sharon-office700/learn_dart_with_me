void main() {
  Person p1 = Person("sharon", true, 22);
  p1.show_data();
  p1.age = 99; //changed property
  // p1.location = "andheri";   <==can't add values to the object not defined in class
}


class Person{
  String? name;
  bool? is_married;
  int? age;

  // Constructor
  Person(String? name, bool? is_married, int? age) {
    this.name = name;
    this.is_married = is_married;
    this.age = age;


    print("running constructor as you created object: $this");
  }

  // class method
  void show_data() {
    print("$name is ${this.is_married! ? "Married" : "Unmarried"} and is ${this.age} years old");
  }
}
