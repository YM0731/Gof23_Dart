/// 名前：プロキシパターン
/// 実装で使えるか：使えない
/// 内容：あるオブジェクトへのアクセスを制限し、
/// クライアントとそのオブジェクトの間に代理を設けるパターン

void main() {
  Image image = ProxyImage('test image.jpg');
  image.display();
  print('------------------');

  image.display();
}

/// 画像基底クラス
abstract class Image {
  /// 表示
  void display();
}

/// 画像クラス
class RealImage implements Image {
  /// ファイル名
  String _fileName;

  /// コンストラクタ
  ///
  /// [_fileName] ファイル名
  RealImage(this._fileName) {
    loadFromDisk(_fileName);
  }

  /// 画像ファイル読み込み
  void loadFromDisk(String fileName) {
    print('Loading $fileName');
  }

  /// 表示
  @override
  void display() {
    print('Display $_fileName');
  }
}

/// ProxyIamge
class ProxyImage implements Image {
  ///画像
  RealImage? _realImage;

  /// ファイル名
  String _fileName;

  /// コンストラクタ
  ///
  /// [_fileName] ファイル名
  ProxyImage(this._fileName);

  /// 表示
  @override
  void display() {
    if (_realImage == null) {
      _realImage = RealImage(_fileName);
    }
    _realImage?.display();
  }
}
