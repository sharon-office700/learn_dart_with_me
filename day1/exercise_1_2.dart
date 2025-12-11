// TODO: Fix all the null safety errors in this code

class Customer {
  String name;
  String? email;
  Address? address;

  Customer(this.name, {this.email, this.address});
}

class Address {
  String street;
  String city;
  String? zipCode;

  Address(this.street, this.city, {this.zipCode});
}

// TODO: Fix this function to handle nulls properly
String getCustomerLocation(Customer? customer) {
  // Should return: "City, ZipCode" or "City" or "Unknown location"
  return customer!.address!.city + ', ' + (customer.address?.zipCode ?? "Unknown Location");
}

// TODO: Fix this function
String getDisplayName(Customer? customer) {
  // Should return email if available, otherwise name, otherwise "Guest"
  return customer?.email ?? customer?.name ?? "Guest" ;
}

// TODO: Fix this function
void sendNotification(Customer customer) {
  // Only send if customer has email
  if (customer.email != null) {
    print('Sending to: ' + customer.email!);   // yaha pe ! daala cuz if ze certain hai ki email null nhi hai 
  }
}

void main() {
  // Test cases - your functions should handle all these
  var customer1 = Customer('John');
  var customer2 = Customer('Jane', email: 'jane@example.com');
  var customer3 = Customer(
    'Bob',
    address: Address('123 Main St', 'Boston', zipCode: '02101'),
  );
  var customer4 = Customer(
    'Alice',
    address: Address('456 Oak Ave', 'Seattle'),
  );

  print(getCustomerLocation(null));       // Unknown location
  print(getCustomerLocation(customer1));  // Unknown location
  print(getCustomerLocation(customer3));  // Boston, 02101
  print(getCustomerLocation(customer4));  // Seattle

  print(getDisplayName(null));       // Guest
  print(getDisplayName(customer1));  // John
  print(getDisplayName(customer2));  // jane@example.com

  sendNotification(customer1);  // Should not print (no email)
  sendNotification(customer2);  // Should print: Sending to: jane@example.com
}
