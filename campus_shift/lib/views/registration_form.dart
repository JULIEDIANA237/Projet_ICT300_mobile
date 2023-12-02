import 'package:campus_shift/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:campus_shift/controllers/registration_controller.dart';
import 'package:campus_shift/models/registration_model.dart';
import 'package:campus_shift/widgets/navbar.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final RegistrationModel _registrationModel = RegistrationModel();
  // ignore: unused_field
  final RegistrationController _registrationController = RegistrationController();
  bool _isErrorVisible = false;
  String _errorMessage = '';

  void _register() async {
    // Vérifier que tous les champs sont remplis
    if (_registrationModel.username.isEmpty ||
        _registrationModel.email.isEmpty ||
        _registrationModel.password.isEmpty) {
      setState(() {
        _isErrorVisible = true;
        _errorMessage = 'Veuillez remplir tous les champs.';
      });
      return;
    }

    // Appeler la méthode d'inscription dans le contrôleur et gérer les erreurs
    /*bool isRegistered = await _registrationController.register(_registrationModel);

    if (isRegistered) {
      // L'inscription a réussi
      setState(() {
        _isErrorVisible = false;
        _errorMessage = '';
      });
      // Effectuer une action appropriée, par exemple, naviguer vers une autre page
    } else {
      // L'inscription a échoué
      setState(() {
        _isErrorVisible = true;
        _errorMessage = 'Un utilisateur avec cet email existe déjà.';
      });
    }*/
  }

  @override
 Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Image.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                padding: EdgeInsets.only(top: 30.0), // Ajout du padding en haut
                child: Text(
                  'Bienvenue Mr/Mme',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
                const SizedBox(height: 100.0),
                const CustomInput(
                  hintText: 'Nom',
                  icon: Icons.person,
                  backgroundColor: Colors.white, // Ajout de l'arrière-plan blanc
                ),
                const SizedBox(height: 10.0),
                const CustomInput(
                  icon: Icons.email,
                  hintText: 'Email',
                  backgroundColor: Colors.white, // Ajout de l'arrière-plan blanc
                ),
                const SizedBox(height: 10.0),
                const CustomInput(
                  icon: Icons.person,
                  hintText: 'Role',
                  backgroundColor: Colors.white, // Ajout de l'arrière-plan blanc
                ),
                const SizedBox(height: 10.0),
                const CustomInput(
                  icon: Icons.phone,
                  hintText: 'Téléphone',
                  backgroundColor: Colors.white, // Ajout de l'arrière-plan blanc
                ),
                const SizedBox(height: 10.0),
                const CustomInput(
                  icon: Icons.lock,
                  hintText: 'Mot De Passe',
                  obscureText: true,
                  backgroundColor: Colors.white, // Ajout de l'arrière-plan blanc
                ),
                const SizedBox(height: 10.0),
                const CustomInput(
                  icon: Icons.lock,
                  hintText: 'Confirmez votre Mot de passe',
                  obscureText: true,
                  backgroundColor: Colors.white, // Ajout de l'arrière-plan blanc
                ),
                const SizedBox(height: 10.0),
                // Ajoutez les autres champs d'inscription ici avec CustomInput
                const SizedBox(height: 10.0),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      // Action pour le bouton Inscription
                    },
                    child: const Text(
                      'Inscription',
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                  ),
                      ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}