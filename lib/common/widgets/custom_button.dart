import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnText;
  final bool isArrow;
  final BorderRadius? borderRadius;
  final bool isLoading;

  const CustomButton(
      {Key? key,
      required this.onPressed,
      required this.btnText,
      this.isLoading = false,
      this.borderRadius,
      this.isArrow = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity, // Button ka width fix karna zaroori hai
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF7D3BF5), Color(0xFFBC6AFC)], // Adjust colors
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius:
              borderRadius ?? BorderRadius.circular(30), // Rounded edges
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Stack(
            alignment: Alignment.center, // Center content
            children: [
              isLoading
                  ? const CupertinoActivityIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      btnText,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
              isArrow
                  ? const Positioned(
                      right: 20, // Adjust kar ke icon ko end pe set karein
                      child: Icon(Icons.arrow_forward, color: Colors.white),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
