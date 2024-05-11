import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';


class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
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
  }) : super(key: key);

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
            style: const TextStyle(color: AppColors.description),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 56,
            child: TextButton(
              onPressed: onClick,
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(prefixIcon),
                  Text(
                    text,
                    textAlign: textAlign,
                    style: const TextStyle(fontSize: 14),
                  ),
                  Icon(suffixIcon),
                ].withSpaceBetween(width: 8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MyTextField extends StatefulWidget {
  const MyTextField({
    Key? key,
    this.isObscured = false,
    this.controller,
    this.validator,
    this.keyboardType,
    this.backgroundColor = const Color(0xff222222),
    this.foregroundColor = const Color(0xffffffff),
    this.hintColor = const Color(0xffF2CE18),
    this.labelText = "",
    this.inputFormatter,
  }) : super(key: key);

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
  MyTextFieldState createState() => MyTextFieldState();
}

class MyTextFieldState extends State<MyTextField> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: widget.inputFormatter,
      keyboardType: widget.keyboardType,
      autofocus: false,
      style: AppTextStyle().subHeader(AppColors.description),
      controller: widget.controller,
      obscureText: widget.isObscured ? isChecked : widget.isObscured,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: AppTextStyle().subHeader(AppColors.description),
        fillColor: AppColors.cardIconFill,
        filled: true,
        hintStyle: const TextStyle(
          color: Colors.yellow,
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
        suffixIcon: widget.isObscured
            ? IconButton(
          icon: Icon(
            isChecked ? FeatherIcons.eye : FeatherIcons.eyeOff,
            color: AppColors.nonActiveIcon,
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
