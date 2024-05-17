import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter_app/provider/auth_provider.dart';
import 'package:provider_counter_app/provider/theme_changer_provider.dart';
import 'package:provider_counter_app/services/network_requister.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({super.key});

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  final emailtxtController = TextEditingController();
  final passwordtxtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login and Registration Use Provider"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            TextFormField(
              controller: emailtxtController,
              decoration: const InputDecoration(
                  hintText: "Enter Email",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordtxtController,
              decoration: const InputDecoration(
                  hintText: "Enter Password",
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 30,
            ),

            //loging button
            Consumer<AuthProvider>(builder: (context,data,child){
              return SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      data.loginWithApi(emailtxtController.text,passwordtxtController.text);

                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),

                    child: data.isLoading?CircularProgressIndicator(): Text("Login"),
                  ));

            })

          ],
        ),
      ),
    );
  }
}
