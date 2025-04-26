import 'package:flutter/material.dart';

extension ResponsiveExtensions on num {
  /// Returns height percentage (1-100) of screen
  double h(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return (this / 100) * screenHeight;
  }

  /// Returns width percentage (1-100) of screen
  double w(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return (this / 100) * screenWidth;
  }

  /// Returns responsive text size based on screen width
  double sp(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return (this / 100) * screenWidth * 0.8; // Adjust multiplier as needed
  }

  /// Returns responsive padding based on screen size
  EdgeInsets p(BuildContext context) {
    final val = (this / 100) * MediaQuery.of(context).size.width;
    return EdgeInsets.all(val);
  }

  /// Returns vertical padding
  EdgeInsets vp(BuildContext context) {
    final val = (this / 100) * MediaQuery.of(context).size.height;
    return EdgeInsets.symmetric(vertical: val);
  }

  /// Returns horizontal padding
  EdgeInsets hp(BuildContext context) {
    final val = (this / 100) * MediaQuery.of(context).size.width;
    return EdgeInsets.symmetric(horizontal: val);
  }
}
