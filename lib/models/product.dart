import '../constants/images.dart';

class Product {
  final String title;
  final String description;
  final String image;
  final double price;

  Product({
    required this.title,
    required this.description,
    required this.image,
    required this.price,
  });

  String get name => title;
}

final List<Product> products = [
  Product(
    title: 'Product 1',
    description: 'Description of Product 1',
    image: Images.product1,
    price: 25.99,
  ),
  Product(
    title: 'Product 2',
    description: 'Description of Product 2',
    image: Images.product2,
    price: 19.99,
  ),
  Product(
    title: 'Product 3',
    description: 'Description of Product 2',
    image: Images.product2,
    price: 19.99,
  ),
  Product(
    title: 'Product 4',
    description: 'Description of Product 2',
    image: Images.product1,
    price: 19.99,
  ),
];

