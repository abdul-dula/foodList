import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/food_provider.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({Key? key}) : super(key: key);

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    final _myList = context.watch<FoodProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFffd379),
        title: Text('my List (${_myList.length})'),
      ),
      body:ListView.builder(
          itemCount:_myList.length,
          itemBuilder: (_,index){
            final currentFood = _myList[index];
            return Card(
              key: ValueKey(currentFood.name),
              color: const Color(0xFF89dad0),
              elevation: 2,
              child: ListTile(
                  title: Text(currentFood.name),
                  subtitle: Text(currentFood.duration ?? ''),
                  trailing: TextButton(
                    child: const Text('Remove',style: TextStyle(color: Colors.red),),
                    onPressed:(){
                        context.read<FoodProvider>().removeFromList(currentFood);
                    },
                  )
              ),
            );
          }
      ) ,
    );
  }
}
