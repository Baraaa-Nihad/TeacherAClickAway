import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final int minLine;
  final int maxLine;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final String? helperText ;
  final Widget? suffixIcon ;

  MyTextField({
    required this.controller,
    required this.label,
    this.minLine = 1,
    this.maxLine = 1,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.helperText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      controller: controller,
      cursorColor: Color.fromARGB(200, 204, 185, 155),
      minLines: minLine,
      maxLines: maxLine,
      style: TextStyle(
        fontSize: 18,
        // color: Colors.grey.shade300,
      ),
      textAlign: TextAlign.start,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Color.fromARGB(200, 204, 185, 155),
              // color:  Colors.grey.shade300,
              width: 2,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Color.fromARGB(200, 204, 185, 155),
              width: 2,
            )),
        helperText:helperText ,

        // label: Text(
        //   label,
        //   style: GoogleFonts.poppins(),
        // ),
        hintText: label,
        labelStyle: TextStyle(color: Color(0xff212121)),
        filled: true,
        // focusColor: Colors.red.shade300,
      ),
    );
  }
}
