import 'package:flutter/material.dart';
import 'package:campus_shift/views/login_page.dart';
import 'package:campus_shift/views/registration_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Form',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) {
              return Scaffold(
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(90),
                  child: AppBar(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 70.0, top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                // Action pour le bouton Enregistrer
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.brown,
                              ),
                              icon: const Icon(
                                Icons.person_add,
                                color: Colors.white,
                              ),
                              label: const Text(
                                'Enregistrer',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            OutlinedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LoginPage()),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              child: const Text(
                                'Connexion',
                                style: TextStyle(
                                  color: Colors.brown,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                body: const RegistrationForm(),
              );
            },
          );
        },
      ),
    );
  }
}