import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'screens/subscription_plan_screen.dart';
import 'screens/login_screen.dart';
import 'screens/confirmation_code_screen.dart';
import 'screens/main_shell.dart';
import 'screens/search_result_screen.dart';
import 'screens/events_screen.dart';
import 'screens/search_input_screen.dart'; // 🔥 added
import 'screens/no_result_screen.dart'; // 🔥 added

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // loads google-services.json automatically
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFFF5F7FB),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF0066FF),
        brightness: Brightness.light,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIDA Application',
      theme: theme,
      routes: {
        SubscriptionPlanScreen.routeName: (_) => const SubscriptionPlanScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        ConfirmationCodeScreen.routeName: (_) => const ConfirmationCodeScreen(),
        MainShell.routeName: (_) => const MainShell(),
        SearchResultScreen.routeName: (_) => const SearchResultScreen(),
        EventsScreen.routeName: (_) => const EventsScreen(),
        SearchInputScreen.routeName: (_) =>
            const SearchInputScreen(), // ✔ added
        NoResultScreen.routeName: (_) => const NoResultScreen(), // ✔ added
      },
      home: const _AuthGate(),
    );
  }
}

/// Handles login → register → OTP → main shell
class _AuthGate extends StatelessWidget {
  const _AuthGate();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final user = snap.data;

        if (user == null) {
          return const SubscriptionPlanScreen();
        }

        return const MainShell();
      },
    );
  }
}
