import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter_app/provider/container_color_change_provider.dart';
import 'package:provider_counter_app/provider/theme_changer_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider=Provider.of<ThemeChangeProvider>(context,listen: false);
    //themechange provider
    print("all widget build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Provider"),
      ),
      body: Center(
        child: Column(
          children: [
            //theme change button
            RadioListTile<ThemeMode>(
              title: Text("Light"),
                value:ThemeMode.light ,
                groupValue: themeProvider.themeMode,
                onChanged: (value){
                  print("value:$value");
                  themeProvider.setTheme(ThemeMode.light);

                },),
            RadioListTile<ThemeMode>(
              title: Text("Dark"),
                value:ThemeMode.dark ,
                groupValue: themeProvider.themeMode,
                onChanged: (value){
                  themeProvider.setTheme(ThemeMode.dark);

                },),
            RadioListTile<ThemeMode>(
              title: Text("system"),
                value:ThemeMode.system ,
                groupValue: themeProvider.themeMode,
                onChanged: (value){
                  themeProvider.setTheme(ThemeMode.system);

                },),
            //container opacity change part
            Consumer<ContainerColorChangeProvider>(
              builder: (BuildContext context, opacityProvider, Widget? child) {
                return Slider(
                    //slider set minimum value 0
                    min: 0,
                    //slider set maximum value 1
                    max: 1,
                    value: opacityProvider.ContainerOpacity,
                    onChanged: (value) {
                      opacityProvider.opacityChange(value);
                    });
              },
            ),
            Consumer<ContainerColorChangeProvider>(
              builder: (BuildContext context, opacityProvider, Widget? child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        color: Colors.green
                            .withOpacity(opacityProvider.ContainerOpacity),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        color: Colors.red
                            .withOpacity(opacityProvider.ContainerOpacity),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
