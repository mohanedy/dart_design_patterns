import 'package:dart_design_patterns/template_method/caffeine_beverage.dart';
import 'package:dart_design_patterns/template_method/with_hook/caffeine_beverage_hook.dart';

class TeaWithHook extends CaffeineBevrageWithHook {
  const TeaWithHook();
  @override
  void addCondiments() {
    print("Adding Lemon");
  }

  @override
  void brew() {
    print("Steeping the tea");
  }

  @override
  bool wantsCondiments() {
    return false;
  }
}
