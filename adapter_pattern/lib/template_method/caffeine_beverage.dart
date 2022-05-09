abstract class CaffeineBevrage {
  const CaffeineBevrage();
  void prepareRecipe() {
    boilWater();
    brew();
    addCondiments();
    pourInCup();
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
