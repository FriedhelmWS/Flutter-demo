/**
 * Some simple examples of Dart language characteristics.
 * 
 * Including introducing different basic types and how class/object works. 
 * 
 * This could give you a brief understanding of Dart's OO-ness.
 */

void main() {
  var name = "Bob";
  dynamic count = 5;

  String antherName = "Alice";

  //print() is basically a console log method
  print("hello, " + name);
  print("I am " + antherName);
  print(count);

  ThreeDPoint p = new ThreeDPoint(1, 2, 3);
  print(p.getLevelByIndex(1));
  print(p.getLevelByIndex(2, 10));

  // The way to initiate a object can be identical to Java
  Cat cat = new Cat();
  cat.eat();

  Cat dog = new Cat();
  print(dog.sound());
}

class Point {
  int x = 0;
  int y = 0;
  final bool valid = true;
  static const String name = "point";

  Point(int x, int y) {
    this.x = x;
    this.y = y;
  }

  getX() => x;
  getY() => y;
}

class ThreeDPoint extends Point {
  double z = 0;
  // List and Map don’t have to specify the element type
  List levels = [1, 2, 3];
  Map degrees = {"key1": 0001, "key2": 0001};

  ThreeDPoint(int x, int y, double z) : super(x, y) {
    this.z = z;
  }

  getLevels() {
    return levels;
  }

  Map getMap() {
    return degrees;
  }

  // Optional parameters are place in []
  int getLevelByIndex(int index, [int? multiplier = 1]) {
    return levels[index] * multiplier;
  }
}

/**
 * The following code are just some examples to show abstract class uses. 
 * A similar OOP concept also can apply to other languages, like Java.

 * Basically, Animal is an abstract class with a defined but not implemented 
 * method. Cat and Dog ‘is an’ animal and need to override abstract functions 
 * to become a concrete class.
 */
abstract class Animal {
  void eat();
  String sound();
}

class Dog extends Animal {
  @override
  void eat() {
    print("Eat bones!");
  }

  @override
  String sound() {
    return "woof";
  }
}

class Cat extends Animal {
  @override
  void eat() {
    print("Eat fish!");
  }

  @override
  String sound() {
    return "meow";
  }
}

enum eyeColours { red, black, brown, blue, green }
