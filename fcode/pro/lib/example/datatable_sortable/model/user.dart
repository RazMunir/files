import 'package:flutter/material.dart';

class User{
  final String firstName;
  final String lastName;
  final int age;

  const User({
    @required this.firstName,
    @required this.lastName,
    @required this.age,
  });
}