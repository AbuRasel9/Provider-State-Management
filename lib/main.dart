import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter_app/Screen/home_screen.dart';
import 'package:provider_counter_app/Screen/login_screen.dart';
import 'package:provider_counter_app/provider/api_call_provider.dart';
import 'package:provider_counter_app/provider/auth_provider.dart';
import 'package:provider_counter_app/provider/theme_changer_provider.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //container opacity change provider
        ChangeNotifierProvider(create: (_)=>ThemeChangeProvider(),),
        ChangeNotifierProvider(create: (_)=>ApiCallProvider(),),
        ChangeNotifierProvider(create: (_)=>AuthProvider(),),
        //dark theme provider
      ],
      child: Builder(
        builder: (context) {
          final themeChange=Provider.of<ThemeChangeProvider>(context);
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeChange.themeMode,
            darkTheme: ThemeData(
              brightness: Brightness.dark
            ),
            home: const Login_screen(),
          );
        }
      ),
    );
  }
}

