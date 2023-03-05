import 'package:flutter/material.dart';

class MailField extends StatefulWidget {
  final TextEditingController controller;

  const MailField({super.key, required this.controller});

  @override
  State<MailField> createState() => _MailFieldState();
}

class _MailFieldState extends State<MailField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: const TextStyle(color: Colors.white),
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          hintText: 'Enter your e-mail address',
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.white), //<-- SEE HERE
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.white54), //<-- SEE HERE
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 4, color: Colors.white54), //<-- SEE HERE
          ),
          prefixIcon: Icon(
            Icons.mail,
            color: Colors.white,
          ),
          hintStyle: TextStyle(color: Colors.white)),
    );
  }
}
