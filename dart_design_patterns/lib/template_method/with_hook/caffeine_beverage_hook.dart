abstract class CaffeineBevrageWithHook {
  const CaffeineBevrageWithHook();
  void prepareRecipe() {
    boilWater();
    brew();
    if (wantsCondiments()) {
      addCondiments();
    }
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

  bool wantsCondiments() {
    return true;
  }
}
