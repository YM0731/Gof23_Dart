/// 名前：コマンドパターン
/// 実装で使えるか：使える
/// 内容:
/// 　クライアントと上k手が疎結合になり、」柔軟な操作の実行が可能になる
/// 　Commandパターンの目的は操作をオブジェクトとしてかプセル化し、
/// 　操作の呼び出し元と実際の処理の実行者を分離すること。
/// 構成要素：
/// 　Command：操作を定義するインターフェース
/// 　ConcreteCommand：Commandインターフェースを実装し、特定の操作を実行
/// 　Reciver：実装に操作を行うオブジェクト
/// 　Invoker：Commandオブジェクトを保持し、操作を実行する
/// 　Client：InvokerとReceiverに必要なCommandオブジェクトを作成

void main() {
  Light livingRoomLight = Light();
  Command lightOn = LightOnCommand(livingRoomLight);
  Command lightOff = LightOffCommand(livingRoomLight);

  RemoteControl remote = RemoteControl();

  remote.setCommand(lightOn);
  remote.pressButton();

  remote.setCommand(lightOff);
  remote.pressButton();
}

/// 照明クラス
class Light {
  /// 照明ON
  void on() {
    print('Light is ON');
  }

  /// 照明OFF
  void off() {
    print('Light is OFF');
  }
}

/// ------------------------------
/// Command
/// ------------------------------
/// コマンド基底クラス
abstract class Command {
  /// 処理実行
  void execute();
}

/// ------------------------------
/// ConcreteCommand
/// ------------------------------
/// 照明ONコマンド
class LightOnCommand implements Command {
  /// 照明
  Light _light;

  /// コンストラクタ
  ///
  /// [_light] 照明
  LightOnCommand(this._light);

  /// 処理実行
  @override
  void execute() {
    _light.on();
  }
}

/// 照明OFFコマンド
class LightOffCommand implements Command {
  /// 照明
  Light _light;

  /// コンストラクタ
  ///
  /// [_light] 照明
  LightOffCommand(this._light);

  /// 処理実行
  @override
  void execute() {
    _light.off();
  }
}

/// ------------------------------
/// Invoker
/// ------------------------------
class RemoteControl {
  /// コマンド
  late Command _command;

  /// コマンド設定
  ///
  /// [command] コマンド
  void setCommand(Command command) {
    this._command = command;
  }

  /// ボタンタップ
  void pressButton() {
    _command.execute();
  }
}
