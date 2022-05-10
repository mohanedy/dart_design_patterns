/*
*Template Method*

*/

import 'package:dart_design_patterns/template_method/coffee.dart';
import 'package:dart_design_patterns/template_method/tea.dart';

void main(List<String> args) {
  final teaCup = Tea();
  teaCup.prepareRecipe();

  final coffeeCup = Coffee();
  coffeeCup.prepareRecipe();
}
