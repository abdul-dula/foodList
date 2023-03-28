import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_list/providers/food_provider.dart';
import 'package:food_list/screens/fav_food.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var food = context.watch<FoodProvider>().food;
    var myList = context.watch<FoodProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFffd379),
        title: const Text("Food Prepartion time"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
                onPressed:(){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>MyListScreen()
                    ),
                  );
                } ,
                icon: const Icon(Icons.favorite),
                label: Text(
                  "Go to my list(${myList.length})",
                      style: const TextStyle(fontSize: 24),
                ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 20)
              ),
            ),
            const SizedBox(height: 15,),
            Expanded(
                child:ListView.builder(
                  itemCount:food.length,
                    itemBuilder: (_,index){
                    final currentFood = food[index];
                    return Card(
                      key: ValueKey(currentFood.name),
                      color: const Color(0xFF89dad0),
                      elevation: 2,
                      child:
                      ListTile(
                        title: Text(currentFood.name,style: const TextStyle(
                          color: Colors.white
                        ),),
                        subtitle: Text(
                            currentFood.duration ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                          ),),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: myList.contains(currentFood) ? Colors.red : Colors.white,
                            size: 30,
                          ),
                        onPressed:(){
                          if(!myList.contains(currentFood)){
                            context.read<FoodProvider>().addToList(currentFood);
                          }else{
                            context.read<FoodProvider>().removeFromList(currentFood);
                          }
                        },
                       )
                      ),
                     );
                    }
                )
            ),
          ],
        ),
      ),
    );
  }
}
