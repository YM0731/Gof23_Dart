/// 名前：アブストラクトファクトリーパターン
/// 実装で使えるか：使える
/// 内容：インスタンス生成するFactoryクラスを抽象化する
/// インスタンス生成手順が同じで異なるオブジェクトを表現する時に使える

void main() {
  UiFactory factory;
  String os = 'windows';

  if (os == 'windows') {
    factory = WindowsFactory();
  } else {
    factory = MacFactory();
  }
  Application app = Application(factory);
  app.render();
}

/// アプリケーション
class Application {
  /// ボタン
  late Button _button;

  /// テキストフィールド
  late TextField _textField;

  /// コンストラクタ
  ///
  /// [factory] factory
  Application(UiFactory factory) {
    this._button = factory.createButton();
    this._textField = factory.createTextField();
  }

  /// 部品描画
  void render() {
    _button.tap();
    _textField.display();
  }
}

/// ----------------------------------------
/// 部品
/// ----------------------------------------
/// ボタン基底クラス
abstract class Button {
  /// タップ処理
  void tap();
}

/// Windowsボタンクラス
class WindowsButton implements Button {
  /// タップ処理
  @override
  void tap() {
    print('windowsButton');
  }
}

/// Macボタンクラス
class MacButton implements Button {
  @override
  /// タップ処理
  void tap() {
    print('macButton');
  }
}

/// テキストフィールド基底クラス
abstract class TextField {
  /// 内容表示
  void display();
}

/// Windowsテキストフィールドクラス
class WindowsTextField extends TextField {
  /// 内容表示
  @override
  void display() {
    print('windowsTextField');
  }
}

/// Macテキストフィールドクラス
class MacTextField extends TextField {
  /// 内容表示
  @override
  void display() {
    print('mactTextField');
  }
}

/// ----------------------------------------
/// Factory
/// ----------------------------------------
/// UiFactory基底クラス
abstract class UiFactory {
  /// ボタン作成
  Button createButton();

  /// テキストフィールド作成
  TextField createTextField();
}

/// WindowsFactory
class WindowsFactory implements UiFactory {
  /// ボタン作成
  @override
  Button createButton() {
    return WindowsButton();
  }

  /// テキストフィールド作成
  @override
  TextField createTextField() {
    return WindowsTextField();
  }
}

/// MacFactory
class MacFactory implements UiFactory {
  /// ボタン作成
  @override
  Button createButton() {
    return MacButton();
  }

  /// テキストフィールド作成
  @override
  TextField createTextField() {
    return MacTextField();
  }
}
