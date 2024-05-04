import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter_app/provider/api_call_provider.dart';
import 'package:provider_counter_app/provider/theme_changer_provider.dart';
import 'package:provider_counter_app/services/network_requister.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchTextController = TextEditingController();

  bool mode = true;

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ApiCallProvider>(context, listen: false).dataGet();
    });

    // NetworkRequister().getData("https://jsonplaceholder.typicode.com/comments/1");
  }

  @override
  Widget build(BuildContext context) {
    print("build mode:$mode");
    final theme = Provider.of<ThemeChangeProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer(builder: (context, data, child) {
            print("00000000000000000000000000000000000000$data");
            return IconButton(
                onPressed: () {
                  //------------>condition check if mode have true than its false other wise false to true<--------------------//

                  if (mode == true) {
                    mode = false;
                  } else {
                    mode = true;
                  }

                  theme.themeChange(mode: mode);
                },
                icon: (mode == true)
                    ? const Icon(Icons.dark_mode)
                    : const Icon(Icons.sunny));
          })
        ],
        title: const Text("api call and search data"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
        child: Consumer<ApiCallProvider>(
          builder: (context, value, child) {
            return Column(
              children: [
                TextFormField(
                  controller: searchTextController,
                  onChanged: (text) {
                    value.search(text);
                  },
                  decoration: InputDecoration(
                      hintText: "Search",
                      /*
                        condition check if search controller empty thake tahole
                        search icon dekhabe na hole remove icon dekhabe remove icon a click korle
                        sob text remove hoye jabe
                      */

                      suffixIcon: searchTextController.text.isEmpty
                          ? const Icon(Icons.search)
                          : IconButton(
                              onPressed: () {
                                value.search("");
                                searchTextController.clear();
                              },
                              icon: Icon(
                                Icons.highlight_remove_outlined,
                              ),
                            ),
                      border: const OutlineInputBorder()),
                ),
                value.isLoading == true
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 15),
                          child: ListView.builder(
                              itemCount: value.data.length,
                              itemBuilder: (context, index) {
                                print("issssssssssss${value.isLoading}");
                                return ListTile(
                                  tileColor: value.data[index].completed
                                      ? Colors.green
                                      : Colors.redAccent,
                                  title: Text(value.data[index].title),
                                  subtitle:
                                      Text(value.data[index].userId.toString()),
                                  trailing: Text(
                                      value.data[index].completed.toString()),
                                );
                              }),
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
