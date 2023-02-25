import 'package:flutter/material.dart';

class CustomColors {
  Color _activePrimaryButton = Color.fromARGB(255, 63, 81, 181);
  Color _activeSecondaryButton = Color.fromARGB(255, 230, 230, 255);
  Color _gradientTopColor = Color.fromARGB(255, 63, 167, 252);
  Color _gradientBottomColor = Color.fromARGB(255, 88, 116, 241);

  Color getActivePrimaryButtomColor() {
    return _activePrimaryButton;
  }

  Color getActiveSecondaryButtonColor() {
    return _activeSecondaryButton;
  }

  Color getGradientTopColor() {
    return _gradientTopColor;
  }

  Color getGradientBottomColor() {
    return _gradientBottomColor;
  }
}
