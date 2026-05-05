import 'package:flutter/material.dart';
import 'package:lab2/widgets/difficulty_controll.dart';
import 'package:lab2/widgets/ingredient_controll.dart';
import 'package:lab2/widgets/kitchen_control.dart';
import 'package:lab2/widgets/price_controll.dart';
import 'package:lab2/widgets/recipe_area.dart';
import 'package:lab2/widgets/time_controll.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row (
        children: [
          _controllPanel(context), 
          RecipeArea()
        ],
      )
    );
  }

  Widget _controllPanel (context, {double width = 320}) {
    return Container(
      width: width,
      color: const Color.fromARGB(255, 293, 210, 218),
      child: Column(
        children: [
          Text('Receptsök'),
          Text('Hitta ett recept som passar genom att ändra inställningarna nedanför.'),
          SizedBox(height: 16,),
          IngredientControll(),
          KitchenControl(),
          SizedBox(height: 16,),
          Text("Svårighetsgrad"),
          DifficultyControll(),
          PriceControll(),
          TimeControll()
        ],
      ),
    );
  }
}


