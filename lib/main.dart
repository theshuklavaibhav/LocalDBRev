import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/homepage.dart';
import './provider/task_provider.dart';
void main(){
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MyApp(),
    )
  ) ; 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: Homepage() 
    ) ; 
  }
}