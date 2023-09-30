import 'package:flutter/material.dart';
import '../models/product.dart';

class AlignContent extends StatelessWidget {
  final Product product;
  const AlignContent(
      {Key? key,
      required this.contentTitle,
      required this.contentText,
      required this.product})
      : super(key: key);
  final String contentTitle;
  final String contentText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < product.features.length ~/ 2; i++)
                Text(contentTitle),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = product.features.length ~/ 2;
                  i < product.features.length;
                  i++)
                Text(contentText,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }
}
