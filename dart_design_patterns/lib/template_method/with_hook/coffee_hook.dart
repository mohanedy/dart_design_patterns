import 'dart:convert';
import 'dart:io';

import 'package:dart_design_patterns/template_method/with_hook/caffeine_beverage_hook.dart';

class CoffeeWithHook extends CaffeineBevrageWithHook {
  @override
  void addCondiments() {
    print("Adding Sugar And Milk");
  }

  @override
  void brew() {
    print("Dripping Coffee through filter");
  }

  @override
  bool wantsCondiments() {
    print("Do you want to add Condiments? ");
    String? a = stdin.readLineSync(encoding: utf8);
    if (a != null && a.toLowerCase() == 'yes') {
      return true;
    } else {
      return false;
    }
  }
}
