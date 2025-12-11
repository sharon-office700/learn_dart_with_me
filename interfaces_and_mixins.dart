// In Dart, every class implicitly defines an interface
// You can implement any class as an interface

abstract class Printable {
  void printDetails();
}

abstract class Serializable {
  Map<String, dynamic> toMap();
}

// Mixin - reusable code that can be "mixed in" to classes
mixin Timestamped {
  DateTime? _createdAt;
  DateTime? _updatedAt;

  DateTime get createdAt => _createdAt ?? DateTime.now();
  DateTime? get updatedAt => _updatedAt;

  void touch() {
    _createdAt ??= DateTime.now();
    _updatedAt = DateTime.now();
  }
}

mixin Validatable {
  List<String> validate();

  bool get isValid => validate().isEmpty;
}

// Using interfaces and mixins
class Product with Timestamped, Validatable implements Printable, Serializable {
  String id;
  String name;
  double price;

  Product({
    required this.id,
    required this.name,
    required this.price,
  }) {
    touch();  // From Timestamped mixin
  }

  // Implement Printable
  @override
  void printDetails() {
    print('Product: $name (\$${price.toStringAsFixed(2)})');
  }

  // Implement Serializable
  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  // Implement Validatable
  @override
  List<String> validate() {
    var errors = <String>[];
    if (name.isEmpty) errors.add('Name is required');
    if (price < 0) errors.add('Price must be non-negative');
    return errors;
  }
}

void main() {
  var product = Product(id: '1', name: 'Widget', price: 29.99);

  product.printDetails();  // Product: Widget ($29.99)
  print(product.toMap());
  print('Is valid: ${product.isValid}');  // true

  var invalidProduct = Product(id: '2', name: '', price: -5);
  print('Validation errors: ${invalidProduct.validate()}');
  // [Name is required, Price must be non-negative]
}
