import 'package:dart_design_patterns/template_method/caffeine_beverage.dart';

class Coffee extends CaffeineBevrage {
  @override
  void addCondiments() {
    print("Adding Sugar And Milk");
  }

  @override
  void brew() {
    print("Dripping Coffee through filter");
  }
}
