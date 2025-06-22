import 'package:flutter/material.dart';

class XTextField extends StatelessWidget {
  const XTextField({super.key, required this.label, this.suffixIcon, this.prefixIcon});
  final String label;
  final Icon? suffixIcon;
  final Icon? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 50,
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            label: Text(
              label,          
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
