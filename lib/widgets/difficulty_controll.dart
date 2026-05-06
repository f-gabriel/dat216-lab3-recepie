import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:provider/provider.dart';

class DifficultyControll extends StatefulWidget{
  const DifficultyControll({super.key});

  @override
  State<DifficultyControll> createState() => _DificultyControlState();
}

class _DificultyControlState extends State<DifficultyControll> {
  String _difficulty = Difficulty.labels[0];

  @override
  Widget build(BuildContext context) {
    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);

    return RadioGroup(
      groupValue: _difficulty,
      onChanged: (value){
        setState(() {
          _difficulty = value!;
          recipeHandler.setDifficulty(value);
          }
        );
      }, 
      child: Column(children: [
        RadioListTile(
            dense: true,
            title: Text(Difficulty.labels[0]),
            value: Difficulty.labels[0]
            ),
        for(final label in Difficulty.labels.sublist(1))
          RadioListTile(
            dense: true,
            title: Row(children: [
              SizedBox(child: Difficulty.icon(label)),
              SizedBox(width: AppTheme.paddingMedium,),
              Text(label),
              ]
            ),
            value: label
          )
        ],
      ),
    );
  }
}