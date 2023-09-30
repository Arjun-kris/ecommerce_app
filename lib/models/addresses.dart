class Address {
  final String name;
  final String phone;
  final String pincode;
  final String state;
  final String address;
  final String town;
  final String city;
  final String addressType;

  Address({
    required this.name,
    required this.phone,
    required this.pincode,
    required this.state,
    required this.address,
    required this.town,
    required this.city,
    required this.addressType,
  });
}

final List<Address> addresses = [
  Address(
    name: 'John Doe',
    phone: '1234567890',
    pincode: '123456',
    state: 'qydf',
    address: '123 Main Street',
    town: 'opdf',
    city: 'Lownsstate',
    addressType: 'Home',
  ),

  Address(
    name: 'Jane Smith',
    phone: '095327890',
    pincode: '345456',
    state: 'tubf',
    address: '456 Oak Avenue',
    town: 'cgjs',
    city: 'Townsville',
    addressType: 'Work',
  ),

  Address(
    name: 'Michael Johnson',
    phone: '6785567890',
    pincode: '789456',
    state: 'vudf',
    address: '789 Elm Street',
    town: 'nkol',
    city: 'Metropolis',
    addressType: 'Home',
  ),
];
