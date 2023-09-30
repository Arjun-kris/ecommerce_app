// ignore_for_file: library_private_types_in_public_api

import 'package:ecommerce_app1/screens/addcardscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ecommerce_app1/constants/colors.dart';
import '../constants/images.dart';
import '../models/card_details_model.dart';
import '../widgets/AppBar.dart';

class ListCardDetails extends StatefulWidget {
  const ListCardDetails({super.key});

  @override
  _ListCardDetailsState createState() => _ListCardDetailsState();
}

class _ListCardDetailsState extends State<ListCardDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NormalAppBar(appTitle: 'Saved Cards'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddcardPage(),
                  ),
                );
              },
              child: const Text(
                '+ Add New Card',
                style: TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 18,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cardDetailsList.length,
                itemBuilder: (context, index) {
                  final cardDetail = cardDetailsList[index];
                  return Slidable(
                    actionPane: const SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    secondaryActions: [
                      IconSlideAction(
                        color: Colors.red,
                        icon: Icons.delete_outlined,
                        onTap: () {
                          setState(() {
                            cardDetailsList.removeAt(index);
                          });
                        },
                      ),
                    ],
                    child: SizedBox(
                      width: double.infinity,
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Image(
                                image: AssetImage(Images.card),
                                height: 50,
                                width: 50,
                              ),
                              const SizedBox(width: 16),
                              Text(
                                cardDetail.cardNumber,
                                style: const TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
