import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: "Email",
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.brown,
      width: 2.0)
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 2.0)
  )
);