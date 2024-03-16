import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/l10n/generated/l10n.dart';
import 'package:todo_app/myProvider/settings_provider.dart';
import 'package:todo_app/myProvider/tasks_provider.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseFirestore.instance.disableNetwork();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => SettingsProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => TasksProvider()..getTasksByDate(),
      ),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SpalshScreen.routName: (_) => const SpalshScreen(),
        HomeScreen.routName: (_) => HomeScreen(),
      },
      theme: AppTheme.lightmode,
      darkTheme: AppTheme.darkmode,
      themeMode: provider.themeMode,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.delegate.supportedLocales,
      locale: Locale(provider.language),
    );
  }
}
