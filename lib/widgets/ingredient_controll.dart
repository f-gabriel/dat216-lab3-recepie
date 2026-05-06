
import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
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
        Text('Ingrediens:',
              style: AppTheme.smallHeading,),
        SizedBox(width: AppTheme.paddingSmall),
        DropdownMenu<String>(
          width: 164,
          enableFilter: false, 
          requestFocusOnTap: false, 
          initialSelection: labels[0],
          dropdownMenuEntries: [
            DropdownMenuEntry(
                value: labels[0], 
                label: labels[0],
                ),
            for(int i = 1; i < labels.length; i++)
              DropdownMenuEntry(
                value: labels[i], 
                label: labels[i],
                leadingIcon: MainIngredient.icon(labels[i]))
          ],
          onSelected: (value){
            recipeHandler.setMainIngredient(value);
          },
        )
      ],
    );
  }
}