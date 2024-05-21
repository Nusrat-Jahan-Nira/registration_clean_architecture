

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registration_clean_architecture/src/core/network/error/registration_exception.dart';
import 'package:registration_clean_architecture/src/feature/registration/presentation/provider/register_provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<RegisterProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Registration page'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                try {
                  await provider.registerUser(
                    _usernameController.text,
                    _emailController.text,
                    _passwordController.text,
                  );
                  // Show success message or navigate to another screen
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Registration successful')),
                  );
                } on RegistrationException catch (e) { // Catch RegistrationException
                  // Show error message from the exception
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.message)),
                  );
                } catch (e) {
                  // For any other exceptions, show a generic error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('An error occurred')),
                  );
                }
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
