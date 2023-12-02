import 'package:flutter/material.dart';
import 'package:campus_shift/widgets/custom_input.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomInput(
          hintText: 'Email',
          icon: Icons.person,
          backgroundColor: Colors.white, 
        ),
        const SizedBox(height: 20),
        const CustomInput(
          hintText: 'Mot De Passe',
          icon: Icons.lock,
          obscureText: true,
          backgroundColor: Colors.white, 
        ),
        const SizedBox(height: 20),
        ElevatedButton(
  onPressed: () {
    // Action pour le bouton Connexion
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.brown,
    fixedSize: const Size(270, 50), // Adjust the size as needed
  ),
  child: const Text(
    'Connexion',
    style: TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
  ),
),
      ],
    );
  }
}