# Template Method (Encapsulating Algorithms)

**The Official Definition:**
The Template Method Pattern defines the skeleton
of an algorithm in a method, deferring some steps to
subclasses. Template Method lets subclasses redefine
certain steps of an algorithm without changing the
algorithm’s structure.
***
**What's Template Method ?** it’s a method that defines an algorithm as a set of steps. One or more of these steps is defined to be abstract and implemented by a subclass. This ensures the algorithm’s structure stays unchanged, while subclasses provide some part of the implementation.
***

## The Problem

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

---
We colud use hook method to enhance our algorithm by making subclasses have the decision whether to invoke `addCondiments()` method or not.

## Advantages

- The Abstract class runs the show; as it has the algorithm, and protects it.

- Maximizes reuse among the subclasses.

- The algorithm lives in one place and code changes only need to be made there.

- The Template Method Pattern provides a framework that other algorithms can be plugged into.

- The abstract class concentrates knowledge about the algorithm and relies on subclasses to provide complete implementations.

## When to use
