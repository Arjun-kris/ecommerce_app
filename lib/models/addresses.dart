class Address {
  final String name;
  final String street;
  final String city;
  final String state;
  final String zipCode;

  Address({
    required this.name,
    required this.street,
    required this.city,
    required this.state,
    required this.zipCode,
  });
}

final List<Address> addresses = [
  Address(
    name: 'John Doe',
    street: '123 Main Street',
    city: 'City',
    state: 'State',
    zipCode: 'Zip Code',
  ),

  Address(
    name: 'Jane Smith',
    street: '456 Oak Avenue',
    city: 'Townsville',
    state: 'State',
    zipCode: 'Zip Code',
  ),

  Address(
    name: 'Michael Johnson',
    street: '789 Elm Street',
    city: 'Metropolis',
    state: 'State',
    zipCode: 'Zip Code',
  ),
];