
import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/constants/assets.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:provider/provider.dart';


class TimeControll extends StatefulWidget{
  const TimeControll({super.key});

  @override
  State<TimeControll> createState() => _TimeControllState();
}

class _TimeControllState extends State<TimeControll>{
  double _Time = 60;

  @override
  Widget build(BuildContext context){
    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);

    return Column(
      children: [
        Slider(
          value: _Time, 
          divisions: 15,
          max: 150,
          onChanged: (double value) {
            setState(() {
              //var newTime = value - (value % 10);
              _Time = value;
            });
          },
          onChangeEnd: (value) {
            int maxTime = value.toInt();
            recipeHandler.setMaxPrice(maxTime);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Padding(
              padding: const EdgeInsets.only(
                right: AppTheme.paddingSmall,
                left: AppTheme.paddingSmall),
              child: Image.asset(Assets.timeIcon, height: 16),
            ),
            Padding(
              padding: const EdgeInsets.only(right: AppTheme.paddingLarge),
              child: Text('${_Time.round()} min'),
            ),
          ],
        ),
        //Text('${_Time.round()} min')
      ],
    );
  }
}