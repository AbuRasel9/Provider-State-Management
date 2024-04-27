import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter_app/home_screen.dart';
import 'package:provider_counter_app/provider/container_color_change_provider.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>ContainerColorChangeProvider(),),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}

