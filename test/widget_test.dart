import 'package:app_transaccional/features/auth/presentation/viewmodels/auth_viewmodel.dart';
import 'package:app_transaccional/features/trips/presentation/viewmodels/trip_viewmodel.dart';
import 'package:app_transaccional/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('muestra la pantalla de inicio de sesion', (tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ChangeNotifierProvider(create: (_) => TripViewModel()),
        ],
        child: const MyApp(),
      ),
    );

    expect(find.text('Bienvenido de nuevo'), findsOneWidget);
    expect(find.text('Iniciar sesión'), findsOneWidget);
  });
}
