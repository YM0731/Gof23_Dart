/// 名前：インタプリタパターン
/// 実装で使えるか：使える
/// 内容：
/// 　文法規則に基づいて分を解釈するためのパターン
/// 　式や分の評価を自動化する場面で使用する
/// 　テキスト解析、SQLクエリの解釈などで使用されることが多い

void main() {
  Expression expression = Subtract(
    leftExpression: Add(leftExpression: Number(5), rightExpression: Number(3)),
    rightExpression: Number(2),
  );
  print('結果： ${expression.inerpret()}');
}

/// 数値基底クラス
abstract class Expression {
  /// 計算処理
  int inerpret();
}

/// 数値クラス
class Number implements Expression {
  /// 数値
  int _number;

  /// コンストラクタ
  ///
  /// [_number] 数値
  Number(this._number);

  /// 計算処理
  @override
  int inerpret() {
    return this._number;
  }
}

/// 加算処理
class Add implements Expression {
  /// 左式
  late Expression _leftExpression;

  /// 右式
  late Expression _rightExpression;

  /// コンストラクタ
  ///
  /// [leftExpression] 左式
  ///
  /// [rightExpression] 右式
  Add({
    required Expression leftExpression,
    required Expression rightExpression,
  }) {
    this._leftExpression = leftExpression;
    this._rightExpression = rightExpression;
  }

  /// 計算処理
  @override
  int inerpret() {
    return _leftExpression.inerpret() + _rightExpression.inerpret();
  }
}

/// 減算処理
class Subtract implements Expression {
  /// 左式
  late Expression _leftExpression;

  /// 右式
  late Expression _rightExpression;

  /// コンストラクタ
  ///
  /// [leftExpression] 左式
  ///
  /// [rightExpression] 右式
  Subtract({
    required Expression leftExpression,
    required Expression rightExpression,
  }) {
    this._leftExpression = leftExpression;
    this._rightExpression = rightExpression;
  }

  /// 計算処理
  @override
  int inerpret() {
    return _leftExpression.inerpret() - _rightExpression.inerpret();
  }
}
