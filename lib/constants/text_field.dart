import 'package:ecommerce_app1/constants/decoration.dart';
import 'package:flutter/material.dart';


Container textcontainer({required String hintText, required Icon prefix}) {
  return Container(
      decoration: textFieldDecoration,
      child: TextField(
        decoration: customInput(hintText: hintText, prefixIcon: prefix),
      ));
}

Container normalcontainer({required String hintText}) {
  return Container(
      decoration: textFieldDecoration,
      child: TextField(
        decoration: normalInput(hintText: hintText),
      ));
}

Container editTextcontainer(
    {required String hintText,
    required TextEditingController tcontroller,
    required Icon prefix}) {
  return Container(
      decoration: textFieldDecoration,
      child: TextField(
        controller: tcontroller,
        decoration: customInput(hintText: hintText, prefixIcon: prefix),
      ));
}

Container editTextcontainer2(
    {required String hintText, required TextEditingController tcontroller}) {
  return Container(
      decoration: textFieldDecoration,
      child: TextField(
        controller: tcontroller,
        decoration: normalInput(hintText: hintText),
      ));
}

Container editTextcontainer3(
    {required String hintText, required TextEditingController tcontroller}) {
  return Container(
    decoration: textFieldDecoration,
    child: TextField(
      controller: tcontroller,
      decoration: normalInput(hintText: hintText),
    ),
  );
}
