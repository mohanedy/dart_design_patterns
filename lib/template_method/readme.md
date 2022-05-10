# Template Method Design Pattern (Encapsulating Algorithms)

- [Template Method Design Pattern (Encapsulating Algorithms)](#template-method-design-pattern-encapsulating-algorithms)
  - [Definations](#definations)
  - [The Problem](#the-problem)
  - [Code Analysis](#code-analysis)
    - [The Template Method](#the-template-method)
    - [Step1 & Step4](#step1--step4)
    - [Step2 & Step3](#step2--step3)
      - [Tea Class](#tea-class)
      - [Coffee Class](#coffee-class)
  - [Testing the design pattern](#testing-the-design-pattern)
    - [Output](#output)
  - [Hook Method](#hook-method)
  - [Advantages](#advantages)
  - [When to use](#when-to-use)
  - [Credits](#credits)

## Definations

**The Official Definition:**
The Template Method Pattern defines the skeleton
of an algorithm in a method, deferring some steps to
subclasses. Template Method lets subclasses redefine
certain steps of an algorithm without changing the
algorithm’s structure.
***
**What's Template Method ?** it’s a method that defines an algorithm as a set of steps. One or more of these steps is defined to be abstract and implemented by a subclass. This ensures the algorithm’s structure stays unchanged, while subclasses provide some part of the implementation.

## The Problem

To make the problem easier to grasp let's say we need to create a program for cafe this program will have the ability to prepare coffee and tea.

| Coffee Recipe | Tea Recipe |
|---|---|
| 1- Boil some water  | 1- Boil some water  |
| 2- Brew coffee in boiling water  | 2- Steep tea in boiling water  |
| 3- Pour coffee in cup  | 3- Pour tea in cup  |
| 4- Add sugar and milk  | 4- Add lemon  |

The `Coffee` class:

```dart
class Coffee {
  void prepareRecipe() {
    boilWater();
    brewCoffeeGrinds();
    pourInCup();
    addSugarAndMilk();
  }

  void boilWater() {
    print("Boiling water");
  }

  void brewCoffeeGrinds() {
    print("Dripping Coffee through filter");
  }

  void pourInCup() {
    print("Pouring into cup");
  }

  void addSugarAndMilk() {
    print("Adding Sugar and Milk");
  }
}
```

Each step is implemented as a seprate method and all of these steps gets called inside `prepareRecipe()` method.

The `Tea` class:

```dart
class Tea {
  void prepareRecipe() {
    boilWater();
    steepTeaBag();
    pourInCup();
    addLemon();
  }

  void boilWater() {
    print("Boiling water");
  }

  void steepTeaBag() {
    print("Steeping the tea");
  }

  void pourInCup() {
    print("Pouring into cup");
  }
   void addLemon() {
    print("Adding Lemon");
  }
}
```

If we compared both classes we will find out that both `boilWater()` and `pourInCup()` steps are identical in both classes so there's code duplication !

| Coffee  | = / ≠ |  Tea |
|---|---|---|
| `boilWater()` | =  | `boilWater()`  |
| `brewCoffeeGrinds()` | ≠  | `steepTeaBag()`  |
| `pourInCup()` | =  | `pourInCup()`  |
| `addSugarAndMilk()` | ≠  | `addLemon()`  |

To eleminate this duplication we colud abstract the commonality into a base class.
let's create class called `CaffineBeverage` that wraps the duplicated code.

Also if we had a closer look we will find that both algorithms are different in two steps that are special for the kind of the caffine beverage we are making, so we colud abstract these two steps so instead of `brewCoffeeGrinds()` and  `steepTeaBag()` steps we colud make abstract step called `brew()`. and for the condiments we colud abstract it to `addCondiments()`

the new design will look like this:

## Code Analysis

### The Template Method

`prepareRecipe()`
is our template method. Why?

Because It serves as a template for an algorithm—in this case, an algorithm for making caffeinated beverages.

In the template, each step of the algorithm is represented by a method.

The `prepareRecipe()` method controls the algorithm. No one can change this, and it counts on subclasses to provide some or all of the implementation.

```dart
  void prepareRecipe() {
    boilWater();       /*<= Step 1*/
    brew();            /*<= Step 2*/
    addCondiments();   /*<= Step 3*/
    pourInCup();      /*<= Step 4*/
  }
```

### Step1 & Step4

`boilWater()` &  `pourInCup()`: are reusable steps in both the tea and the coffee recipes so it's implemented using the template method class `CaffeineBeverage`.

### Step2 & Step3

`brew()` &  `pourInCup()`: these methods are declared as abstract because there implementation differs in different recipies so it's get implemented by subclasses.

#### Tea Class

```dart
class Tea extends CaffeineBevrage {
  @override
  void addCondiments() {
    print("Adding Lemon");
  }

  @override
  void brew() {
    print("Steeping the tea");
  }
}
```

#### Coffee Class

```dart
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
```

## Testing the design pattern

```dart
void main(List<String> args) {
  final cupOfTea = Tea();
  cupOfTea.prepareRecipe();

  print("============");

  final cupOfCoffee = Coffee();
  cupOfCoffee.prepareRecipe();
}
```

`prepareRecipe()` => calls the algorithm methods which some is implemented by our `Tea` & `Coffee` classes and others are implemented already by the `CaffeineBeverage` abstract class.

### Output

```text
Boiling Water
Steeping the tea
Adding Lemon
Pouring into cup
============
Boiling Water
Dripping Coffee through filter
Adding Sugar And Milk
Pouring into cup
```

## Hook Method

***Hook*** is a method that is declared in the abstract class, but only given an empty or default implementation. This gives subclasses the ability to “hook into” the algorithm at various points, if they wish; a subclass is also free to ignore the hook.
***
We colud use hook method to enhance our algorithm by making subclasses have the decision whether to invoke `addCondiments()` method or not.

To do this first we will modify `CaffeineBevrage` abstract class by adding concrete method `wantsCondiments()` that decide whether to add condiments or not by default.

Let's say we will make it by default always adding condiments.

```dart
abstract class CaffeineBevrageWithHook {
          ...
  bool wantsCondiments() {
    return true;
  }
}
```

Next we will modify our template method `prepareRecipe()` by adding condition that decides whether to add condiments or not.

```dart
abstract class CaffeineBevrageWithHook {
  void prepareRecipe() {
    boilWater();
    brew();
    if (wantsCondiments()) {
      addCondiments();
    }
    pourInCup();
  }

                              ...
}
```

Now if we tested the code we will find the same output as previous, but if we want user to decide we may override the `wantsCondiments()` method in one of our subclasses `Coffee` / `Tea` and provide different implementation

```dart
class CoffeeWithHook extends CaffeineBevrageWithHook {
                          ....
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
```

Now lets test the code

```sh
Boiling Water
Dripping Coffee through filter
Do you want to add Condiments? No
Pouring into cup
```

## Advantages

- The Abstract class runs the show; as it has the algorithm, and protects it.

- Maximizes reuse among the subclasses.

- The algorithm lives in one place and code changes only need to be made there.

- The Template Method Pattern provides a framework that other algorithms can be plugged into.

- The abstract class concentrates knowledge about the algorithm and relies on subclasses to provide complete implementations.

## When to use

## Credits

The example used in this article is from Head First Design Patterns 2nd edition.
