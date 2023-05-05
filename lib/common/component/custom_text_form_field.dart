import 'package:flutter/material.dart';
import 'package:flutter_delivery/common/constant/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autofocus;
  final ValueChanged<String>? onChanged;

  const CustomTextFormField({
    required this.onChanged,
    this.autofocus = false,
    this.obscureText = false,
    this.hintText,
    this.errorText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: C_INPUT_BORDER,
        width: 1.0,
      ),
    );

    return TextFormField(
      onChanged: onChanged,
      cursorColor: C_PRIMARY,
      obscureText: obscureText,
      autofocus: autofocus,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20.0),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: C_BODY_TEXT,
          fontSize: 14.0,
        ),
        errorText: errorText,
        fillColor: C_INPUT_BG,
        filled: true,
        border: baseBorder,
        enabledBorder: baseBorder,
        focusedBorder: baseBorder.copyWith(
          borderSide: baseBorder.borderSide.copyWith(
            color: C_PRIMARY,
          ),
        ),
      ),
    );
  }
}
