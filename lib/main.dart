import 'package:flutter/material.dart';
import 'package:food_list/providers/food_provider.dart';
import 'package:food_list/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<FoodProvider>(
    child: const MyApp(),
    create: (_) =>FoodProvider(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
