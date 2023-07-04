import 'package:flutter/material.dart';

import '../colors.dart';

class CustomTextField extends StatelessWidget {
  final IconData? icon;

  final String hint;

  final Function(String) onChanged;



  const CustomTextField(
      {super.key,
        required this.hint,
        required this.onChanged,
        this.icon,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(icon,color: a3,),
          filled: true,
          fillColor: a2.withOpacity(0.3),
          hintText: hint,
          hintStyle:  TextStyle(color: a2),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
