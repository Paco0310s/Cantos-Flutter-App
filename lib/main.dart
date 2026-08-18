import 'dart:io';

import 'package:cantos_flutter/providers/login_provider.dart';
import 'package:cantos_flutter/providers/navigation_drawer_provider.dart';
import 'package:cantos_flutter/providers/new_scheem_provider.dart';
import 'package:cantos_flutter/providers/new_song_provider.dart';
import 'package:cantos_flutter/providers/register_provider.dart';
import 'package:cantos_flutter/providers/scheems_provider.dart';
import 'package:cantos_flutter/providers/songs_provider.dart';
import 'package:cantos_flutter/providers/splash_provider.dart';
import 'package:cantos_flutter/providers/user_provider.dart';
import 'package:cantos_flutter/providers/view_song_provider.dart';
import 'package:cantos_flutter/utils/constans.dart';
import 'package:cantos_flutter/views/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  if (!Platform.isLinux) {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => NavigationDrawerProvider()),
        ChangeNotifierProvider(create: (_) => NewScheemProvider()),
        ChangeNotifierProvider(create: (_) => NewSongProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => ScheemsProvider()),
        ChangeNotifierProvider(create: (_) => SongsProvider()),
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ViewSongProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constants.appName,
        theme: ThemeData(
          textTheme: GoogleFonts.abelTextTheme(),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: Constants.color1,
            titleTextStyle: TextStyle(
              color: Constants.color4,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            foregroundColor: Constants.color4,
          ),
          // PopupMenuThemeData(
          popupMenuTheme: const PopupMenuThemeData(
            color: Constants.color1,
            labelTextStyle: WidgetStatePropertyAll(
              TextStyle(
                color: Constants.color4,
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            )
          ),
          scaffoldBackgroundColor: Constants.color4,
          colorScheme: const ColorScheme(
            primary: Constants.color2,
            secondary: Colors.green,
            surface: Constants.color1,
            error: Colors.purple,
            onPrimary: Constants.color1,
            onSecondary: Colors.grey,
            onSurface: Colors.black,
            onError: Colors.orange,
            brightness: Brightness.light,
          )
        ),
        home: const SplashView(),
      ),
    );
  }
}
