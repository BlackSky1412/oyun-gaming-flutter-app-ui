import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/screens/splash_screen.dart';
import 'package:oyun_gaming_flutter/utils/app_theme.dart';
import 'package:oyun_gaming_flutter/utils/constant.dart';

void main() async {
  textPrimaryColorGlobal = white;

  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp().then((value) {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  }).catchError(onError);

  fontFamilyBoldGlobal = GoogleFonts.oxanium().fontFamily;
  fontFamilyPrimaryGlobal = GoogleFonts.oxanium().fontFamily;
  fontFamilySecondaryGlobal = GoogleFonts.oxanium().fontFamily;
  textSecondaryColorGlobal = Colors.white.withOpacity(0.7);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: applicationName,
      debugShowCheckedModeBanner: false,
      darkTheme: AppThemeData.darkTheme,
      themeMode: ThemeMode.dark,
      home: SplashScreen(),
    );
  }
}
