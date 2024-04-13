// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class myButton extends StatelessWidget {
  const myButton({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.text = "",
    this.textAlign = TextAlign.start,
    this.backgroundColor = const Color(0xff292929),
    this.foregroundColor = const Color(0xffffffff),
    this.isExpand = true,
    required this.onClick,
    this.label = "",
    this.labelWidth,
  });
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String text;
  final TextAlign textAlign;
  final Color backgroundColor;
  final Color foregroundColor;
  final bool isExpand;
  final VoidCallback onClick;
  final String label;
  final double? labelWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: labelWidth,
          child: Text(
            label,
            style: const TextStyle(color: Color(0xFF30475E)),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 56,
            child: TextButton(
              onPressed: onClick,
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  backgroundColor: backgroundColor,
                  foregroundColor: foregroundColor),
              child: Row(
                children: [
                  Icon(prefixIcon),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Text(
                    text,
                    textAlign: textAlign,
                    style: const TextStyle(fontSize: 14),
                  )),
                  const SizedBox(width: 10),
                  Icon(suffixIcon),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class myTextField extends StatefulWidget {
  const myTextField({
    super.key,
    this.isObscured = false,
    this.controller,
    this.validator,
    this.keyboardType,
    this.backgroundColor = const Color(0xff222222),
    this.foregroundColor = const Color(0xffffffff),
    this.hintColor = const Color(0xffF2CE18),
    this.labelText = "",
    this.inputFormatter,
  });
  final bool isObscured;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color hintColor;
  final String labelText;
  final List<TextInputFormatter>? inputFormatter;

  @override
  myTextFieldState createState() => myTextFieldState();
}

class myTextFieldState extends State<myTextField> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: widget.inputFormatter,
      keyboardType: widget.keyboardType,
      autofocus: false,
      style: const TextStyle(
          fontSize: 11,
          color: Color(0xFF30475E),
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.none),
      controller: widget.controller,
      obscureText: widget.isObscured ? isChecked : widget.isObscured,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(
            fontSize: 11,
            color: Color(0xFF30475E),
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.none),
        fillColor: const Color(0xFFF5F5F5),
        filled: true,
        hintStyle: const TextStyle(
            color: Colors.yellow, fontWeight: FontWeight.normal, fontSize: 14),
        suffixIcon: widget.isObscured
            ? IconButton(
                icon: Icon(
                  isChecked ? FeatherIcons.eye : FeatherIcons.eyeOff,
                  color: const Color(0xFF30475E),
                ),
                onPressed: () {
                  setState(() {
                    isChecked = !isChecked;
                  });
                },
              )
            : null,
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFFFFFF)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFFFFFF)),
        ),
      ),
    );
  }
}
