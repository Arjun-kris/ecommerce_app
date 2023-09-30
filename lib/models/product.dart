import '../constants/images.dart';

class Product {
  final String title;
  final String description;
  final List<String> images;
  final double price;
  final List<String> highlights;
  final List<String> features;
  final String modelname;
  final String color;
  final String tpass;
  final String package;
  final String design;
  final String sweatproof;
  final String waterproof;
  final String series;
  final List<ProductReview1> reviews;
  final double rating;
  bool isFavorite;
  bool iscart;

  Product({
    required this.title,
    required this.description,
    required this.images,
    required this.price,
    required this.highlights,
    required this.features,
    required this.modelname,
    required this.color,
    required this.tpass,
    required this.package,
    required this.design,
    required this.sweatproof,
    required this.waterproof,
    required this.series,
    required this.rating,
    this.reviews = const [],
    required this.isFavorite,
    required this.iscart,
  });

  String get name => title;

  findByCategory(String categoryName) {}

  void addReview(ProductReview1 review) {
    reviews.add(review);
  }
}


class ProductReview1 {
  final String username;
  final String date;
  final String comment;
  final double rating;

  ProductReview1({
    required this.username,
    required this.date,
    required this.comment,
    required this.rating,
  });
}


final List<Product> products = [
  Product(
    title: 'RunFlex 2000',
    description:
        'The RunFlex 2000 by SportPro is the perfect choice for both comfort and performance. These unisex running shoes in classic black and white not only offer a stylish look but also provide a cushioned sole and breathable mesh upper for your daily jog or workout routine.',
    images: [
      Images.product1_1,
      Images.product1_2,
      Images.product1_3,
    ],
    price: 25.99,
    highlights: [
      'Unisex running shoes for all genders',
      'Stylish black and white design',
      'Cushioned sole for comfort during workouts',
      'Breathable mesh upper for enhanced ventilation',
      'Ideal for daily jogging and exercise routines'
    ],
    features: [
      'Breathable mesh upper for enhanced ventilation',
      'Cushioned sole for comfort during workouts',
    ],
    modelname: 'RunFlex 2000',
    color: 'Grey',
    tpass: 'Running shoes',
    package: '1 SHOES',
    design: 'Unisex',
    sweatproof: 'Yes',
    waterproof: 'Yes',
    series: 'SportPro',
    rating: 4,
    reviews: [
      ProductReview1(
        username: 'User1',
        comment: 'Great product!',
        date: '1 month',
        rating: 4.5,
      ),
      ProductReview1(
        username: 'User2',
        comment: 'I love it!',
        date: '1 month',
        rating: 5.0,
      ),
      ProductReview1(
        username: 'User3',
        comment: 'Bad experience!',
        date: '1 month',
        rating: 1.5,
      ),
      ProductReview1(
        username: 'User4',
        comment: 'Nice Product',
        date: '1 month',
        rating: 3.0,
      ),
      ProductReview1(
        username: 'User5',
        comment: 'I love it!',
        date: '1 month',
        rating: 4.0,
      )
    ],
    isFavorite: true,
    iscart: false,
  ),


  Product(
    title: 'AcousticMaster X500',
    description:
        'The AcousticMaster X500 headphones by SoundWave offer exceptional sound quality with active noise cancellation, making them perfect for immersive music experiences and travel. Immerse yourself in the world of music with the AcousticMaster X500 headphones by SoundWave. These sleek black headphones deliver exceptional sound quality, thanks to their active noise cancellation technology. With a 20-hour battery life and Bluetooth 5.0 connectivity, you can enjoy your favorite tunes without interruptions, whether you\'re at home or on the go.',
    images: [
      Images.product2_1,
      Images.product2_2,
      Images.product2_3,
    ],
    price: 19.99,
    highlights: [
      'Exceptional sound quality with active noise cancellation',
      '20-hour battery life for uninterrupted listening',
      'Bluetooth 5.0 connectivity for seamless pairing',
      'Stylish black design for a sleek look',
      'Ideal for immersive music experiences and travel'
    ],
    features: [
      'Breathable mesh upper for enhanced ventilation',
      'Cushioned sole for comfort during workouts',
    ],
    modelname: 'AcousticMaster X500 Wireless Headphones', 
    color: 'Black',
    tpass: 'On-Ear Headphones',
    package: '1 HEADPHONES',
    design: 'Over the Head',
    sweatproof: 'Yes',
    waterproof: 'Yes',
    series: 'SoundWave',
    rating: 3,
    reviews: [
      ProductReview1(
        username: 'User1',
        comment: 'Great product!',
        date: '1 month',
        rating: 4.5,
      ),
      ProductReview1(
        username: 'User2',
        comment: 'I love it!',
        date: '1 month',
        rating: 5.0,
      ),
      ProductReview1(
        username: 'User3',
        comment: 'Bad experience!',
        date: '1 month',
        rating: 1.5,
      ),
      ProductReview1(
        username: 'User4',
        comment: 'Nice Product',
        date: '1 month',
        rating: 3.0,
      ),
      ProductReview1(
        username: 'User5',
        comment: 'I love it!',
        date: '1 month',
        rating: 4.0,
      )
    ],
    isFavorite: false,
    iscart: true,
  ),


  Product(
    title: 'SonicBass Pro',
    description:
        'AudioTech\'s SonicBass Pro headphones are your ticket to a bass-driven audio experience. Featuring a stylish silver design and a remarkable 30-hour battery life, these wireless headphones are perfect for music enthusiasts who crave deep, powerful bass. They offer Bluetooth 4.2 connectivity for seamless listening.',
    images: [
      Images.product3_1,
      Images.product3_2,
      Images.product3_3,
    ],
    price: 19.99,
    highlights: [
      'Deep bass and crystal-clear audio quality',
      'Impressive 30-hour battery life for extended use',
      'Wireless convenience with Bluetooth 4.2 connectivity',
      'Sleek silver design for a modern aesthetic',
      'Perfect for music enthusiasts seeking powerful bass'
    ],
    features: [
      'Breathable mesh upper for enhanced ventilation',
      'Cushioned sole for comfort during workouts',
    ],
    modelname: 'SonicBass Pro Wireless Headphones',
    color: 'Black',
    tpass: 'On-Ear Headphones',
    package: '1 HEADPHONES',
    design: 'Over the Head',
    sweatproof: 'Yes',
    waterproof: 'Yes',
    series: 'AudioTech',
    rating: 5,
    reviews: [
      ProductReview1(
        username: 'User1',
        comment: 'Great product!',
        date: '1 month',
        rating: 4.5,
      ),
      ProductReview1(
        username: 'User2',
        comment: 'I love it!',
        date: '1 month',
        rating: 5.0,
      ),
      ProductReview1(
        username: 'User3',
        comment: 'Bad experience!',
        date: '1 month',
        rating: 1.5,
      ),
      ProductReview1(
        username: 'User4',
        comment: 'Nice Product',
        date: '1 month',
        rating: 3.0,
      ),
      ProductReview1(
        username: 'User5',
        comment: 'I love it!',
        date: '1 month',
        rating: 4.0,
      )
    ],
    isFavorite: false,
    iscart: false,
  ),


  Product(
    title: 'ClassicGlide 500',
    description:
        'Step into timeless style and unmatched comfort with the ClassicGlide 500 loafers from FashionFoot. These brown men\'s casual shoes are versatile, suitable for both formal and casual occasions, ensuring you\'re at ease and looking sharp wherever you go.',
    images: [
      Images.product4_1,
      Images.product4_2,
      Images.product4_3,
    ],
    price: 19.99,
    highlights: [
      'Classic brown men\'s casual loafers',
      'Suitable for both formal and casual occasions',
      'Timeless design for versatile wear',
      'Comfortable fit for all-day comfort',
      'A must-have for a stylish and relaxed look'
    ],
    features: [
      'Breathable mesh upper for enhanced ventilation',
      'Cushioned sole for comfort during workouts',
    ],
    modelname: 'ClassicGlide 500 Loafer Shoes',
    color: 'Grey',
    tpass: 'Loafer Shoes',
    package: '1 SHOES',
    design: 'Unisex',
    sweatproof: 'Yes',
    waterproof: 'Yes',
    series: 'FashionFoot',
    rating: 3,
    reviews: [
      ProductReview1(
        username: 'User1',
        comment: 'Great product!',
        date: '1 month',
        rating: 4.5,
      ),
      ProductReview1(
        username: 'User2',
        comment: 'I love it!',
        date: '1 month',
        rating: 5.0,
      ),
      ProductReview1(
        username: 'User3',
        comment: 'Bad experience!',
        date: '1 month',
        rating: 1.5,
      ),
      ProductReview1(
        username: 'User4',
        comment: 'Nice Product',
        date: '1 month',
        rating: 3.0,
      ),
      ProductReview1(
        username: 'User5',
        comment: 'I love it!',
        date: '1 month',
        rating: 4.0,
      )
    ],
    isFavorite: false,
    iscart: false,
  ),
];
