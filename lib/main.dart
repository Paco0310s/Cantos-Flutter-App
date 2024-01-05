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
import 'package:cantos_flutter/views/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  if (!Platform.isWindows && !Platform.isLinux) {
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
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.grey[800],
          hintColor: Colors.grey[600],
          fontFamily: GoogleFonts.abel().fontFamily,
        ),
        home: const SplashView(),
      ),
    );
  }
}
