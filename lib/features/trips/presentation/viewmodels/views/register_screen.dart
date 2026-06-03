import 'dart:io';

import 'package:app_transaccional/features/auth/presentation/viewmodels/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _birthdateController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  File? _imageFile;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _birthdateController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  bool get _hasRequiredFields {
    return _nameController.text.trim().isNotEmpty &&
        _lastnameController.text.trim().isNotEmpty &&
        _emailController.text.trim().isNotEmpty &&
        _phoneController.text.trim().isNotEmpty &&
        _birthdateController.text.trim().isNotEmpty &&
        _passwordController.text.isNotEmpty;
  }

  Future<void> _pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      _imageFile = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: colors.primaryContainer.withValues(alpha: 0.5),
                child: Icon(Icons.person_add, size: 40, color: colors.primary),
              ),
              const SizedBox(height: 24),
              Text(
                'Crear cuenta',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: colors.onSurface,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Completa tus datos para registrarte',
                style: TextStyle(fontSize: 14, color: colors.outline),
              ),
              const SizedBox(height: 32),
              Card(
                color: colors.surfaceContainerLowest,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(labelText: 'Nombre'),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _lastnameController,
                        decoration: const InputDecoration(
                          labelText: 'Apellidos',
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Correo electrónico',
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: 'Teléfono',
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _birthdateController,
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(
                          labelText: 'Fecha de nacimiento',
                          hintText: 'aaaa-mm-dd',
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () => setState(
                              () => _obscurePassword = !_obscurePassword,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _confirmPasswordController,
                        obscureText: _obscureConfirmPassword,
                        decoration: InputDecoration(
                          labelText: 'Confirmar contraseña',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureConfirmPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () => setState(
                              () => _obscureConfirmPassword =
                                  !_obscureConfirmPassword,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: _pickImage,
                              icon: Icon(Icons.image, color: colors.primary),
                              label: Text(
                                _imageFile == null
                                    ? 'Seleccionar imagen'
                                    : _imageFile!.path
                                          .split(Platform.pathSeparator)
                                          .last,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: colors.primary),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          onPressed: authViewModel.isLoading
                              ? null
                              : () async {
                                  if (!_hasRequiredFields) {
                                    _showMessage('Completa todos los campos');
                                    return;
                                  }
                                  if (_passwordController.text !=
                                      _confirmPasswordController.text) {
                                    _showMessage(
                                      'Las contraseñas no coinciden',
                                    );
                                    return;
                                  }
                                  final success = await authViewModel.register(
                                    name: _nameController.text.trim(),
                                    lastname: _lastnameController.text.trim(),
                                    email: _emailController.text.trim(),
                                    phoneNumber: _phoneController.text.trim(),
                                    birthdate: _birthdateController.text.trim(),
                                    password: _passwordController.text,
                                    imageFile: _imageFile,
                                  );
                                  if (!context.mounted) return;
                                  if (!success) {
                                    _showMessage(
                                      authViewModel.errorMessage ??
                                          'No se pudo crear la cuenta',
                                    );
                                    return;
                                  }
                                  Navigator.pop(context);
                                },
                          child: authViewModel.isLoading
                              ? CircularProgressIndicator(
                                  color: colors.onPrimary,
                                )
                              : Text(
                                  'Crear cuenta',
                                  style: TextStyle(
                                    color: colors.onPrimary,
                                    fontSize: 16,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¿Ya tienes cuenta? ',
                    style: TextStyle(color: colors.outline),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      'Iniciar sesión',
                      style: TextStyle(
                        color: colors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
