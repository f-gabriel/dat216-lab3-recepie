import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/widgets/difficulty_controll.dart';
import 'package:lab2/widgets/ingredient_controll.dart';
import 'package:lab2/widgets/kitchen_control.dart';
import 'package:lab2/widgets/logo.dart';
import 'package:lab2/widgets/price_controll.dart';
import 'package:lab2/widgets/time_controll.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({super.key});
  final double width = 320;

  @override
  Widget build(BuildContext context){
    return Container(
      width: width,
      //color: const Color.fromARGB(255, 293, 210, 218),
      child: Column(
        children: [
          Logo(),
          Text(
            'Hitta ett recept som passar genom att ändra inställningarna nedanför.'),
          SizedBox(height: 16,),
          IngredientControll(),
          KitchenControl(),
          SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text(
              "Svårighetsgrad",
              style: AppTheme.smallHeading,),],
          ),
          DifficultyControll(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text(
              "Maxpris",
              style: AppTheme.smallHeading,),],
          ),
          PriceControll(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text(
              "Maxtid",
              style: AppTheme.smallHeading,),],
          ),
          TimeControll()
        ],
      ),
    ); 
  }
}