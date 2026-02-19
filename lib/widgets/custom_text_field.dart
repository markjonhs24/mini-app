import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Custom TextField widget with extensive customization options for styling and behavior.
class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final bool? enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final int? maxLength;
  final int? maxLines;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final BorderRadius? borderRadius;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final Color? disabledBorderColor;
  final double? borderWidth;
  final double? focusedBorderWidth;
  final double? borderRadiusValue;

  const CustomTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.maxLength,
    this.maxLines = 1,
    this.textStyle,
    this.hintStyle,
    this.contentPadding,
    this.borderRadius,
    this.focusedBorderColor,
    this.enabledBorderColor,
    this.disabledBorderColor,
    this.borderWidth = 1.0,
    this.focusedBorderWidth = 2.0,
    this.borderRadiusValue = 25.0,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      enabled: enabled,
      obscureText: obscureText,
      maxLength: maxLength,
      maxLines: maxLines,
      style: textStyle ??
          const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle ??
            TextStyle(
              color: Colors.grey.shade500,
              fontSize: 16,
            ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        counterText: '',
        border: OutlineInputBorder(
          borderRadius:
              borderRadius ?? BorderRadius.circular(borderRadiusValue!),
          borderSide: BorderSide(
            color: enabledBorderColor ?? Colors.grey,
            width: borderWidth!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              borderRadius ?? BorderRadius.circular(borderRadiusValue!),
          borderSide: BorderSide(
            color: focusedBorderColor ?? Colors.deepOrange,
            width: focusedBorderWidth!,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius:
              borderRadius ?? BorderRadius.circular(borderRadiusValue!),
          borderSide: BorderSide(
            color: enabledBorderColor ?? Colors.grey.shade300,
            width: borderWidth!,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius:
              borderRadius ?? BorderRadius.circular(borderRadiusValue!),
          borderSide: BorderSide(
            color: disabledBorderColor ?? Colors.grey.shade200,
            width: borderWidth!,
          ),
        ),
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
      ),
    );
  }
}
