import 'package:flutter/material.dart';

const API_KEY = '37b2654d338023c318312c90b5eee0ba';

const kInputDecoration = InputDecoration(
  filled: true,
  icon: Icon(
    Icons.movie,
    color: Colors.white,
  ),
  hintText: 'Enter movie name',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide.none),
);