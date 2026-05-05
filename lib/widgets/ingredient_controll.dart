
import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/util/main_ingredient.dart';
import 'package:provider/provider.dart';

class IngredientControll extends StatelessWidget{
  const IngredientControll({super.key});

  @override
  Widget build(BuildContext context) {
    const labels = MainIngredient.labels;
    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Ingrediens:'),
        DropdownMenu<String>(
          width: 164,
          enableFilter: false, 
          requestFocusOnTap: false, 
          initialSelection: labels[0],
          dropdownMenuEntries: [
            for(int i = 0; i < labels.length; i++)
              DropdownMenuEntry(
                value: labels[i], 
                label: labels[i],
                leadingIcon: MainIngredient.icon(labels[i]),)
          ],
          onSelected: (value){
            recipeHandler.setMainIngredient(value);
          },
        )
      ],
    );
  }
}