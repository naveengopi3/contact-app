import 'package:contact_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormFields extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obsecureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;

  const CustomTextFormFields({
    super.key,
    this.hintText,
    this.labelText,
    required this.controller,
    this.validator,
    this.keyboardType,
    this.obsecureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obsecureText,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        helperStyle: TextStyle(color: AppColors.black),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: AppColors.grey, width: 2),
        ),
        border: OutlineInputBorder(),
      ),
    );
  }
}
