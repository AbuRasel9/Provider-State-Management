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
  bool mode = true;




  @override
  initState()  {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ApiCallProvider>(context,listen: false).dataGet();
    });


    // NetworkRequister().getData("https://jsonplaceholder.typicode.com/comments/1");
  }

  @override
  Widget build(BuildContext context) {

    print("build mode:$mode");
    final theme = Provider.of<ThemeChangeProvider>(context,);
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
                icon:
                    (mode == true) ? Icon(Icons.dark_mode) : Icon(Icons.sunny));
          })
        ],
        title: Text("Home Screen"),
      ),
      body: Consumer<ApiCallProvider>(builder: (context,value,child){
        return ListView.builder(
          itemCount: value.data.length,
            itemBuilder: (context,index){
          return  ListTile(
            tileColor: value.data[index].completed ? Colors.green :Colors.redAccent,
            title: Text(value.data[index].title ),
            subtitle: Text(value.data[index].userId.toString() ),
            trailing: Text(value.data[index].completed.toString() ),
          );
        });
      },),
    );
  }
}
