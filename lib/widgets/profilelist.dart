import 'package:flutter/material.dart';
import 'package:ecommerce_app1/constants/colors.dart';

class ProfileList extends StatelessWidget {
  const ProfileList(
      {Key? key,
      required this.profileText,
      required this.profilefunction,
      required this.leadingIcon})
      : super(key: key);
  final String profileText;
  final void Function() profilefunction;
  final IconData leadingIcon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
          title: Text(
            profileText,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
          ),
          leading: Icon(leadingIcon, color: AppColors.primaryColor),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: profilefunction),
    );
  }
}

class SignoutList extends StatelessWidget {
  const SignoutList(
      {Key? key,
      required this.profileText,
      required this.profilefunction,
      required this.leadingIcon})
      : super(key: key);
  final String profileText;
  final void Function() profilefunction;
  final IconData leadingIcon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
          title: Text(
            profileText,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: AppColors.redColor),
          ),
          leading: Icon(leadingIcon, color: AppColors.redColor),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: profilefunction),
    );
  }
}

class ExpandList extends StatelessWidget {
  const ExpandList(
      {Key? key,
      required this.profileText,
      required this.profilefunction,
      required this.profilefunction2,
      required this.leadingIcon})
      : super(key: key);
  final String profileText;
  final void Function() profilefunction;
  final void Function() profilefunction2;
  final IconData leadingIcon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpansionTile(
        collapsedTextColor: AppColors.secondaryColor,
        textColor: AppColors.secondaryColor,
        iconColor: AppColors.secondaryColor,
        title: Text(
          profileText,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
        ),
        leading: Icon(leadingIcon, color: AppColors.primaryColor),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        childrenPadding: const EdgeInsets.symmetric(vertical: 10),
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            const SizedBox(width: 70),
            ElevatedButton(
              onPressed: profilefunction,
              style: ElevatedButton.styleFrom(
                elevation: 3,
                backgroundColor: Colors.white,
                fixedSize: const Size(100, 70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Icon(
                      Icons.credit_card,
                      color: AppColors.primaryColor,
                      size: 30,
                    ),
                  ),
                  Text(
                    'Saved Cards',
                    style: TextStyle(fontSize: 10, color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: profilefunction2,
              style: ElevatedButton.styleFrom(
                elevation: 3,
                backgroundColor: Colors.white,
                fixedSize: const Size(90, 70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Icon(
                      Icons.account_balance_wallet,
                      color: AppColors.primaryColor,
                      size: 30,
                    ),
                  ),
                  Text(
                    'Saved UPI',
                    style: TextStyle(fontSize: 10, color: Colors.black),
                  ),
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
