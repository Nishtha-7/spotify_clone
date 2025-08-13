import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/domin/app_routes.dart';
import 'package:spotify_clone/ui/auth/auth_provider.dart' as custom_auth;
import 'package:spotify_clone/ui/auth/login_page.dart';
import 'package:spotify_clone/ui/dashboard/dashboard_page.dart';
import 'package:spotify_clone/ui/dashboard/navigations/songAlbumDetails/SongProvider.dart';
import 'package:spotify_clone/ui/splash/splash_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_) => SongProvider()),
    ChangeNotifierProvider(create: (_) => custom_auth.AuthProvider()),
      ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: 'Roboto',
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routes: AppRoutes.getRoutes(),
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData) {
                // User is logged in
                return const DashboardPage();
              }
              // User is NOT logged in
              return const LoginPage();
            },
          ),

        ),
    );
  }
}
