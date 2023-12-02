import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  
  final IconData icon;
  final String hintText;
  final bool obscureText;
  final Color backgroundColor;

  const CustomInput({
    Key? key,
    
    required this.icon,
    required this.hintText,
    this.obscureText = false,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0), // Ajout de l'espacement vertical
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}