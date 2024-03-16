import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class TextFormFieldItem extends StatelessWidget {
  TextEditingController controller;
  String text;
  int? maxLines;
  TextFormFieldItem(
      {required this.controller, this.maxLines, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        decoration: InputDecoration(
          helperMaxLines: maxLines,
          // hintMaxLines: maxLines,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff5D9CEC)),
          ),
          label: Text(
            text,
            style: GoogleFonts.inter(
                textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffa9a9a99c))),
          ),
        ));
  }
}
