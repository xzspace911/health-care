// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:health_care/presentation/Utils/responsive.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class XTextFieldOnscure extends StatefulWidget {
  const XTextFieldOnscure({
    super.key,
    required this.label,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    required this.obscureText,
  });

  final String label;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final TextEditingController? controller;
  final bool obscureText;

  @override
  State<XTextFieldOnscure> createState() => _XTextFieldOnscureState();
}

class _XTextFieldOnscureState extends State<XTextFieldOnscure> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: XResponsive.xHeight(context) / 15,
        child: TextField(
          obscureText: _obscureText,
          controller: widget.controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            label: Text(
              widget.label,
              style: TextStyle(
                fontSize: XResponsive.xWidth(context) / 27,
              ),
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Iconsax.eye_slash_copy : Iconsax.eye_copy,
                    ),
                    onPressed: _toggleVisibility,
                  )
                : widget.suffixIcon,
          ),
        ),
      ),
    );
  }
}
