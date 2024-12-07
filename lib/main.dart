import 'package:flutter/material.dart';
import 'data/vk_api.dart';
import 'models/apps_response.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VK Apps Get',
      home: Scaffold(
        appBar: AppBar(
          title: Text('VK Apps Get'),
        ),
        body: Center(
          child: FutureBuilder<AppsResponse>(
            future: VkApi().fetchApps(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final apps = snapshot.data?.items ?? [];
                return ListView.builder(
                  itemCount: apps.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(apps[index].title),
                      subtitle: Text('ID: ${apps[index].id}, Type: ${apps[index].type}'),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
