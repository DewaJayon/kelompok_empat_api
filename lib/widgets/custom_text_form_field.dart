import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.onPressed,
    required this.obscureText,
    this.icon,
  });

  final String hintText;
  final String labelText;
  final VoidCallback onPressed;
  final bool obscureText;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: TextFormField(
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(icon),
                onPressed: () {
                  onPressed();
                },
              ),
              border: InputBorder.none,
              labelText: labelText,
              hintText: hintText,
            ),
            obscureText: obscureText,
          ),
        ),
      ),
    );
  }
}
