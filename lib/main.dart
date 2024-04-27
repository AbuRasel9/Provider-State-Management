import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter_app/home_screen.dart';
import 'package:provider_counter_app/provider/container_color_change_provider.dart';
import 'package:provider_counter_app/provider/theme_changer_provider.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //container opacity change provider
        ChangeNotifierProvider(create: (_)=>ContainerColorChangeProvider(),),
        //dark theme provider
        ChangeNotifierProvider(create: (_)=>ThemeChangeProvider())
      ],
      child: Builder(
        builder: (context) {
          final themeChange=Provider.of<ThemeChangeProvider>(context);
          print("theme change ${themeChange.themeMode}");
          return  MaterialApp(
            themeMode: themeChange.themeMode,
            darkTheme: ThemeData(
              brightness: Brightness.dark
            ),
            home: HomeScreen(),
          );
        }
      ),
    );
  }
}

