/// 使用：微妙
/// 内容：オブジェクトをの機能を柔軟に拡張するための構造パターン
/// 使用方法：
/// 　基本的には、対象となるオブジェクトをインターフェースや抽象クラスで定義して、
/// 　それに対してDecoratorとなるクラスが別のオブジェクトをラップする形で機能を追加していく。
/// 　この手法を使用することで既存のクラスを直接変更を加えずに動的に機能を拡張できる
///
/// 利点、注意点：
/// 　複数のデコレーターを組み合わせる場合、クラス間の依存関係が増加するため設計段階で注意が必要

void main() {
  Coffee coffee = SimpleCoffee();
  print('${coffee.getDescription()} \$ ${coffee.getCost()}');

  coffee = MilkDecorator(coffee);
  print('${coffee.getDescription()} \$ ${coffee.getCost()}');
}

/// コーヒー基底クラス
abstract class Coffee {
  /// 詳細表示
  String getDescription();

  /// コスト表示
  double getCost();
}

/// コーヒー
class SimpleCoffee implements Coffee {
  /// 詳細表示
  @override
  String getDescription() {
    return 'Simple Coffee';
  }

  /// コスト表示
  @override
  double getCost() {
    return 2.0;
  }
}

/// --------------------
/// Decorator
/// --------------------
/// コーヒーDecorator基底クラス
abstract class CoffeeDecorator implements Coffee {
  Coffee decoratedCoffee;

  CoffeeDecorator(this.decoratedCoffee);

  /// 詳細表示
  String getDescription() {
    return decoratedCoffee.getDescription();
  }

  /// コスト表示
  double getCost() {
    return decoratedCoffee.getCost();
  }
}

/// ミルクコーヒーDecorator
class MilkDecorator extends CoffeeDecorator {
  /// コンストラクタ
  ///
  /// [coffee] コーヒー
  MilkDecorator(super.coffee);

  /// 詳細表示
  @override
  String getDescription() {
    return decoratedCoffee.getDescription() + ', Milk';
  }

  /// コスト表示
  @override
  double getCost() {
    return decoratedCoffee.getCost() + 0.5;
  }
}
