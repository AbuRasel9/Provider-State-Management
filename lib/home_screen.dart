import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter_app/provider/container_color_change_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print("all widget build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Provider"),
      ),
      body: Center(
        child: Column(
          children: [

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
