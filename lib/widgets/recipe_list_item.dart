import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/util/cuisine.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:lab2/util/main_ingredient.dart';

class RecipeListItem extends StatelessWidget{
  const RecipeListItem(this.recipe, {required this.onTap, super.key});

  final Recipe recipe;
  final void Function() onTap;

  

  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)),
      child: Container(
        height: 128,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          splashColor: Colors.blue.withAlpha(30),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(
                        left: AppTheme.paddingMedium,
                        right: AppTheme.paddingMedium
                        ),
            child: Row(
              spacing: AppTheme.paddingMedium,
              children: [
              _image(recipe),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppTheme.paddingSmall,
                  children: [
                    Text(
                      recipe.name,
                      style: AppTheme.mediumHeading),
                    Text(
                      recipe.description,
                      overflow: TextOverflow.ellipsis, 
                      maxLines: 2,
                    ),
                    Row(children: [
                      Padding(
                          padding: const EdgeInsets.only(left: AppTheme.paddingTiny),
                          child: MainIngredient.icon(recipe.mainIngredient)),
                        Padding(
                        padding: const EdgeInsets.only(
                          left: AppTheme.paddingTiny,
                          right: AppTheme.paddingTiny
                          ),
                          child: Difficulty.icon(recipe.difficulty)),
                      Text('${recipe.time} minuter ${recipe.price} kr')]),
              ] ,
            ) ,
            ),
          ],
        ),
        ),
      ),
      ),
    );
  }

  Widget _image(Recipe recipe) {
    var square = ClipRect(
      child: Container(
        width: 104, // Square width
        height: 104, // Square height
        child: FittedBox(fit: BoxFit.cover, child: recipe.image),
      ),
    );
    var flagImage = Cuisine.flag(recipe.cuisine, width: 24.0);

    return Stack(
      children: [square, Positioned(bottom: 8, right: 8, child: flagImage!)],
    );
  }



  /*@override
  Widget build(BuildContext context){
    return ListTile(
      leading: recipe.image,
      title: Text(recipe.name),
      onTap: onTap,
      shape: Border.all(),
    );
  }*/
}