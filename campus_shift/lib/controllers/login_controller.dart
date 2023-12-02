import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:campus_shift/models/login_model.dart';

class LoginController {
  final LoginModel model;

  LoginController(this.model);

  void setEmail(String value) {
    model.email = value;
  }

  void setPassword(String value) {
    model.password = value;
  }

  void submit(BuildContext context) async {
    if (model.validate()) {
      // Vérifier si un utilisateur est déjà connecté avec la même adresse e-mail
      bool isUserLoggedIn = await checkUserLoggedIn(model.email);

      if (isUserLoggedIn) {
        // Afficher un message d'erreur en dessous de l'adresse e-mail
        model.isEmailError = true;
        model.emailErrorMessage = 'Un utilisateur est déjà connecté avec cette adresse e-mail.';
      } else {
        // Effectuer l'action de connexion en utilisant l'API de Laravel
        bool loginSuccess = await loginUser(model.email, model.password);

        if (loginSuccess) {
          // Après une connexion réussie, naviguer vers une autre page
          Navigator.pushNamed(context, '/dashboard');
        } else {
          // Afficher une erreur de connexion
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Erreur de connexion'),
                content: const Text('Adresse e-mail ou mot de passe incorrect.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      }
    }
  }

  Future<bool> checkUserLoggedIn(String email) async {
    // Appeler l'API de Laravel pour vérifier si un utilisateur est déjà connecté avec l'adresse e-mail donnée
    // Utilisez votre propre URL d'API et structure de réponse JSON
    String apiUrl = 'https://example.com/api/check-user-logged-in';

    var response = await http.post(
      Uri.parse(apiUrl),
      body: {'email': email},
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      // Vérifier la réponse JSON de l'API pour déterminer si un utilisateur est connecté
      if (data['userLoggedIn'] == true) {
        return true;
      }
    }

    return false;
  }

  Future<bool> loginUser(String email, String password) async {
    // Appeler l'API de Laravel pour effectuer l'action de connexion
    // Utilisez votre propre URL d'API et structure de réponse JSON
    String apiUrl = 'https://example.com/api/login';

    var response = await http.post(
      Uri.parse(apiUrl),
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      // Vérifier la réponse JSON de l'API pour déterminer si la connexion est réussie
      if (data['success'] == true) {
        return true;
      }
    }

    return false;
  }
}