import 'package:flutter/material.dart';

class XTextField extends StatefulWidget {
  const XTextField({super.key, required this.label, this.suffixIcon, this.prefixIcon, this.controller});
  final String label;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final TextEditingController? controller;

  @override
  State<XTextField> createState() => _XTextFieldState();
}

class _XTextFieldState extends State<XTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 50,
        child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            label: Text(
              widget.label,          
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
          ),
        ),
      ),
    );
  }
}
