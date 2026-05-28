import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../auth/presentation/viewmodels/auth_viewmodel.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AuthViewModel>();
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: colorScheme.primaryContainer,
                  child: Icon(Icons.person_add, size: 40, color: colorScheme.primary),
                ),
                const SizedBox(height: 24),
                Text(
                  'Crear Cuenta',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  'Completa tus datos para registrarte',
                  style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.outline),
                ),
                const SizedBox(height: 32),
                Card(
                  elevation: 1,
                  color: colorScheme.surfaceContainerLowest,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: colorScheme.surfaceContainerHighest, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        TextFormField(decoration: const InputDecoration(labelText: 'Nombre Completo')),
                        const SizedBox(height: 16),
                        TextFormField(decoration: const InputDecoration(labelText: 'Correo Electrónico')),
                        const SizedBox(height: 16),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(labelText: 'Contraseña', suffixIcon: Icon(Icons.visibility)),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(labelText: 'Confirmar Contraseña', suffixIcon: Icon(Icons.visibility)),
                        ),
                        const SizedBox(height: 24),
                        viewModel.isLoading
                            ? const CircularProgressIndicator()
                            : ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Crear Cuenta'),
                        ),
                        const SizedBox(height: 16),
                        Divider(color: colorScheme.surfaceContainerHigh),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: RichText(
                            text: TextSpan(
                              text: '¿Ya tienes cuenta? ',
                              style: TextStyle(color: colorScheme.outline),
                              children: [
                                TextSpan(
                                  text: 'Iniciar Sesión',
                                  style: TextStyle(color: colorScheme.tertiary, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}