import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/widgets/control_panel.dart';
import 'package:lab2/widgets/recipe_area.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: AppTheme.paddingMedium,
          right: AppTheme.paddingMedium,
          top: AppTheme.paddingMedium,
          bottom: AppTheme.paddingMedium),
        child: Row (
        spacing: AppTheme.paddingMedium,
        children: [
          ControlPanel(), 
          RecipeArea()
        ],
      ))
    );
  }

  /*Widget _controllPanel (context, {double width = 320}) {
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
  }*/
}


