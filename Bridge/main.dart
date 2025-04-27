/// 抽象部分実装部分を分離し、それぞれを独立して拡張可能にする手法

void main() {
  Shape redCircle = Circle(RedColor());
  Shape buleSquare = Square(BuleColor());

  redCircle.draw();
  buleSquare.draw();
}

/// 色基底クラス
abstract class Color {
  /// 色出力
  void applayColor();
}

/// 赤色クラス
class RedColor implements Color {
  /// 色出力
  @override
  void applayColor() {
    print('赤');
  }
}

/// 青色クラス
class BuleColor implements Color {
  /// 色出力
  @override
  void applayColor() {
    print('青');
  }
}

/// 形基底クラス
abstract class Shape {
  /// 色
  late Color color;

  /// コンストラクタ
  ///
  /// [color] 色
  Shape(Color color) {
    this.color = color;
  }

  /// 描画
  void draw();
}

/// 円クラス
class Circle extends Shape {
  /// コンストラクタ
  ///
  /// [color] 色
  Circle(super.color);

  /// 描画
  @override
  void draw() {
    print('円を描く');
    color.applayColor();
  }
}

/// 四角クラス
class Square extends Shape {
  /// コンストラクタ
  ///
  /// [color] 色
  Square(super.color);

  /// 描画
  @override
  void draw() {
    print('四角を描く');
    color.applayColor();
  }
}
