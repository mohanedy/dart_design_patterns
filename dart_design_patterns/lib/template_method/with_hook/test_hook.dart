import 'package:dart_design_patterns/template_method/with_hook/coffee_hook.dart';

void main(List<String> args) {
  final cupOfCoffee = CoffeeWithHook();
  cupOfCoffee.prepareRecipe();
}
