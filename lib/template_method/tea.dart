import 'package:dart_design_patterns/template_method/caffeine_beverage.dart';

class Tea extends CaffeineBevrage {
  const Tea();
  @override
  void addCondiments() {
    print("Adding Lemon");
  }

  @override
  void brew() {
    print("Steeping the tea");
  }
}
