import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/ingredient.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/ui_controller.dart';
import 'package:provider/provider.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/util/cuisine.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:lab2/util/main_ingredient.dart';

class RecipeDetail extends StatelessWidget{
  const RecipeDetail(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UiController>(context, listen: false);
    
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)),
      child: Padding(
            padding: const EdgeInsets.only(
                        left: AppTheme.paddingMedium,
                        right: AppTheme.paddingMedium
                        ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [IconButton(
                    onPressed: (){
                    uiController.deselectRecipe();
                    }, 
                  icon: Icon(Icons.close)
                )
                ],
                ),
                Row(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _image(recipe),
                      Padding(
                        padding: const EdgeInsets.only(top: AppTheme.paddingTiny),
                        child:  Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [Text('Ingredienser',
                        style: AppTheme.smallHeading,)],
                      )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: AppTheme.paddingTiny),
                        child:  Text('${recipe.servings} portioner')
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: AppTheme.paddingMedium),
                        child:  Column(
                          children: [
                            for(final ingredient in recipe.ingredients)
                              Text('${ingredient.amount} ${ingredient.unit} ${ingredient.name}')
                        ],)
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(padding: const EdgeInsets.only(top: AppTheme.paddingTiny),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                        padding: const EdgeInsets.only(left: AppTheme.paddingMedium),
                        child:  Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [Text(recipe.name,
                        style: AppTheme.largeHeading,)],
                          )
                        ),
                      Padding(
                        padding: const EdgeInsets.only(top: AppTheme.paddingTiny),
                        child:  Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: AppTheme.paddingTiny),
                              child: MainIngredient.icon(recipe.mainIngredient)),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: AppTheme.paddingTiny,
                                right: AppTheme.paddingTiny
                          ),
                              child: Difficulty.icon(recipe.difficulty)
                              ),
                            Text('${recipe.time} minuter ${recipe.price} kr')
                            ]
                            ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: AppTheme.paddingMedium),
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [Text(recipe.description,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis, 
                                  maxLines: 2,)],
                          )
                        ),
                            Padding(
                              padding: const EdgeInsets.only(left: AppTheme.paddingMedium),
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [Text(
                                  recipe.instruction,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis, 
                                  maxLines: 72,)
                                  ],
                      )
                    )
                  ]
                ),
              )
            )
          ],
        )
      ]
    ),
  )
);
    
    
    /*Row(children: [
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
    );*/

    
  }
  Widget _image(Recipe recipe) {
    var square = ClipRect(
      child: Container(
        width: 240, // Square width
        height: 240, // Square height
        child: FittedBox(fit: BoxFit.cover, child: recipe.image),
      ),
    );
    var flagImage = Cuisine.flag(recipe.cuisine, width: 60.0);

    return Stack(
      children: [square, Positioned(bottom: 8, right: 8, child: flagImage!)],
    );
  }
}