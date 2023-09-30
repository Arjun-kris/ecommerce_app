class CardDetailsModel {
  final String cardNumber;
  final String cardHolder;
  final String expiryDate;
  final String cvv;

  CardDetailsModel({
    required this.cardNumber,
    required this.cardHolder,
    required this.expiryDate,
    required this.cvv,
  });
}


List<CardDetailsModel> cardDetailsList = [
    CardDetailsModel(
      cardNumber: '1234 5678 9012 3456',
      cardHolder: 'John Doe',
      expiryDate: '12/24',
      cvv: '123',
    ),

    CardDetailsModel(
      cardNumber: '3453 5678 9012 3456',
      cardHolder: 'John Doe',
      expiryDate: '12/24',
      cvv: '123',
    ),
  ];