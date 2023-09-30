import 'package:ecommerce_app1/constants/colors.dart';
import 'package:flutter/material.dart';

class Commonbutton extends StatelessWidget {
  const Commonbutton(
      {Key? key, required this.buttonText, required this.buttonfunction})
      : super(key: key);
  final String buttonText;
  final void Function() buttonfunction;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonfunction,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        fixedSize: const Size(400, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class Endbutton extends StatelessWidget {
  const Endbutton(
      {Key? key,
      required this.buttonText,
      required this.buttonfunction,
      required this.offsetx,
      required this.offsety})
      : super(key: key);
  final String buttonText;
  final void Function() buttonfunction;
  final double? offsetx;
  final double? offsety;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FractionalTranslation(
        translation: Offset(offsetx ?? 0.0, offsety ?? 0.0),
        child: ElevatedButton(
          onPressed: buttonfunction,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            fixedSize: const Size(400, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class Splashbutton extends StatelessWidget {
  const Splashbutton(
      {Key? key,
      required this.buttonText,
      required this.buttonfunction,
      required this.offsetx,
      required this.offsety})
      : super(key: key);
  final String buttonText;
  final void Function() buttonfunction;
  final double? offsetx;
  final double? offsety;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FractionalTranslation(
        translation: Offset(offsetx ?? 0.0, offsety ?? 0.0),
        child: ElevatedButton(
          onPressed: buttonfunction,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            fixedSize: const Size(360, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class Smallbutton extends StatelessWidget {
  const Smallbutton(
      {Key? key, required this.buttonText, required this.buttonfunction})
      : super(key: key);
  final String buttonText;
  final void Function() buttonfunction;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonfunction,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        fixedSize: const Size(250, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class Buynowbutton extends StatelessWidget {
  const Buynowbutton(
      {Key? key, required this.buttonText, required this.buttonfunction})
      : super(key: key);
  final String buttonText;
  final void Function() buttonfunction;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonfunction,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        fixedSize: const Size(250, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class Addcartbutton extends StatelessWidget {
  const Addcartbutton(
      {Key? key, required this.buttonIcon, required this.buttonfunction})
      : super(key: key);
  final IconData buttonIcon;
  final void Function() buttonfunction;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonfunction,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
        fixedSize: const Size(100, 50),
      ),
      child: Align(alignment: Alignment.center, child: Icon(buttonIcon, color: Colors.white)),
    );
  }
}
