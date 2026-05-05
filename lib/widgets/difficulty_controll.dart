import 'package:flutter/material.dart';
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
        for(final label in Difficulty.labels)
          RadioListTile(
            dense: true,
            title: Text(label),
            value: label)
        ],
      ),
    );
  }
}