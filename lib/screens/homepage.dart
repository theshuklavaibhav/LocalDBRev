import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'addScreen.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(leading: Icon(Icons.task), title: Text("HomePage")),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (ctx) => AddScreen())); 
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
