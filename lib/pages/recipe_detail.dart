import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/ui_controller.dart';
import 'package:provider/provider.dart';

class RecipeDetail extends StatelessWidget{
  const RecipeDetail(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UiController>(context, listen: false);
    
    return Row(children: [
      SizedBox(
        height: 200,
        width: 300,
        child: recipe.image
          ),
      SizedBox(width: 30),
      Text(recipe.name),
      SizedBox(width: 60),
      IconButton(
        onPressed: (){
          uiController.deselectRecipe();
          }, 
        icon: Icon(Icons.close)
        )
      ],
    );
  }
}