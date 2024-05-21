import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registration_clean_architecture/src/core/util/injections.dart';
import 'package:registration_clean_architecture/src/feature/registration/presentation/page/registration_page.dart';

void main() {
  
  runApp(
      MultiProvider(
          providers: providers,
          child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RegistrationPage(),
    );
  }
}

