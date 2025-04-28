/// 名前：コンポジットパターン
/// 実装で使えるか：使えない
/// 内容：Compositeパターンの使用方法は、再帰的な構造を扱う場面で特に有効

void main() {
  FileLeaf file1 = FileLeaf(name: 'Document.txt', size: 120);
  FileLeaf file2 = FileLeaf(name: 'Phote.jpg', size: 450);

  FolderComposite folder1 = FolderComposite('MyDocuments');
  FolderComposite subFolder1 = FolderComposite('subDocuments1');
  FileLeaf sub11File = FileLeaf(name: 'sub1Document.txt', size: 120);
  FileLeaf sub12File = FileLeaf(name: 'sub1Phote.jpg', size: 450);

  FolderComposite subFolder2 = FolderComposite('subDocuments2');
  FileLeaf sub21File = FileLeaf(name: 'sub2Document.txt', size: 120);
  FileLeaf sub22File = FileLeaf(name: 'sub2Phote.jpg', size: 450);

  FolderComposite subFolder3 = FolderComposite('subDocuments3');

  folder1.addComponent(file1);
  folder1.addComponent(file2);

  folder1.addComponent(subFolder1);
  subFolder1.addComponent(sub11File);
  subFolder1.addComponent(sub12File);

  folder1.addComponent(subFolder2);
  subFolder2.addComponent(sub21File);
  subFolder2.addComponent(sub22File);
  subFolder2.addComponent(subFolder3);
  folder1.showDetails();
}

/// ----------------------------------------
/// Components
/// ----------------------------------------
/// ファイルコンポーネント基底クラス
abstract class FileComponent {
  /// 詳細
  void showDetails();
}

/// ファイルクラス
class FileLeaf extends FileComponent {
  /// ファイル名
  late String _name;

  /// ファイルサイズ
  late int _size;

  /// コンストラクタ
  ///
  /// [name] ファイル名
  ///
  /// [size] ファイルサイズ
  FileLeaf({required String name, required int size}) {
    this._name = name;
    this._size = size;
  }

  /// 詳細表示
  @override
  void showDetails() {
    print('File$_name , Size$_size');
  }
}

/// ----------------------------------------
/// Composite
/// ----------------------------------------
/// フォルダComposite
class FolderComposite extends FileComponent {
  /// フォルダ名
  late String _name;

  /// フォルダ構造
  List<FileComponent> _components = [];

  /// コンストラクタ
  ///
  /// [name] フォルダ名
  FolderComposite(String name) {
    this._name = name;
  }

  /// ファイル/フォルダ追加
  void addComponent(FileComponent component) {
    _components.add(component);
  }

  /// ファイル/フォルダ削除
  void removeComponent(FileComponent component) {
    _components.remove(component);
  }

  /// 詳細表示
  @override
  void showDetails() {
    print('Folder:$_name');
    _components.forEach((component) => component.showDetails());
  }
}
