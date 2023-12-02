import 'package:campus_shift/views/registration_form.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegistrationForm()),
                  );
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
                  // Action pour le bouton Connexion
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
    );
  }
}