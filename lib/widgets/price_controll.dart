
import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:provider/provider.dart';

class PriceControll extends StatefulWidget{
  const PriceControll({super.key});

  @override
  State<PriceControll> createState() => _PriceControllState();
}

class _PriceControllState extends State<PriceControll>{
  double _Price = 60;
  

  @override
  Widget build(BuildContext context){
    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);

    return Column(
      children: [
        Slider(
          value: _Price, 
          divisions: 40,
          max: 200,
          onChanged: (double value) {
            setState(() {
              _Price = value;
            });
          },
          onChangeEnd: (value) {
            int maxPrice = value.toInt();
            recipeHandler.setMaxPrice(maxPrice);
          },
        ),
        Text('${_Price.round()} kr'),
      ],
    );
  }
}