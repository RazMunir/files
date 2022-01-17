import 'package:flutter/material.dart';

class RecommendedJobModel{
  final String jobTitle;
  final String jobLocation;
  final String companyImageSource;
  final Color backgroundColor;

  RecommendedJobModel(
      this.jobTitle,
      this.jobLocation,
      this.companyImageSource,
      this.backgroundColor
  );
}