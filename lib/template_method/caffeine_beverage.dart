import 'package:meta/meta.dart';

abstract class CaffeineBevrage {
  const CaffeineBevrage();

  @nonVirtual
  void prepareRecipe() {
    boilWater();
    brew();
    pourInCup();
    addCondiments();
  }

  void brew();
  void addCondiments();
  void boilWater() {
    print('Boiling Water');
  }

  void pourInCup() {
    print('Pouring into cup');
  }
}
