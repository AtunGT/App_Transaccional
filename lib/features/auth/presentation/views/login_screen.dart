import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../trips/presentation/viewmodels/views/my_trips_screen.dart';
import '../../../trips/presentation/viewmodels/views/register_screen.dart';
import '../viewmodels/auth_viewmodel.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  child: Icon(Icons.directions_car, size: 40, color: colorScheme.primary),
                ),
                const SizedBox(height: 24),
                Text(
                  'Bienvenido de nuevo',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  'Inicia sesión en tu cuenta',
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
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Correo Electrónico'),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Contraseña',
                            suffixIcon: Icon(Icons.visibility),
                          ),
                        ),
                        const SizedBox(height: 24),
                        viewModel.isLoading
                            ? const CircularProgressIndicator()
                            : ElevatedButton(
                          onPressed: () async {
                            final success = await context.read<AuthViewModel>().login('test@test.com', '123456');
                            if (success && context.mounted) {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MyTripsScreen()));
                            }
                          },
                          child: const Text('Iniciar Sesión'),
                        ),
                        const SizedBox(height: 16),
                        Divider(color: colorScheme.surfaceContainerHigh),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterScreen()));
                          },
                          child: RichText(
                            text: TextSpan(
                              text: '¿No tienes cuenta? ',
                              style: TextStyle(color: colorScheme.outline),
                              children: [
                                TextSpan(
                                  text: 'Regístrate',
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