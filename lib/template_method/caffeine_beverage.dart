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

  @nonVirtual
  void boilWater() {
    print('Boiling Water');
  }

  @nonVirtual
  void pourInCup() {
    print('Pouring into cup');
  }

  void brew();
  void addCondiments();
}
