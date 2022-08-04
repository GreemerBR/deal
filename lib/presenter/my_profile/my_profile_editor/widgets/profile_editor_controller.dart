import 'package:flutter/material.dart';

class ProfileEditorController {
  final TextEditingController nameController;
  final TextEditingController apelidoController;
  final TextEditingController cpfController;
  final TextEditingController emailController;
  final TextEditingController telefoneController;
  final TextEditingController cepController;
  final TextEditingController ruaController;
  final TextEditingController numeroController;
  final TextEditingController complementoController;

  ProfileEditorController({
    required this.nameController,
    required this.apelidoController,
    required this.cpfController,
    required this.emailController,
    required this.telefoneController,
    required this.cepController,
    required this.ruaController,
    required this.numeroController,
    required this.complementoController,
  });
}
