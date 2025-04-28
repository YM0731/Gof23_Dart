/// 名前：ファサードパターン
/// 使用有無：使えそう
/// 内容:
/// 　処理の窓口を用意するデザインパターン
/// メリット：
/// 　1 内部ロジックのブラックボックス化
/// 　　呼び出し側が詳細を知る必要がない
/// 　2 インターフェースがシンプルになる
/// 　　疎結合になる
/// 　3 処理概要がFacadeにまとまる

void main() {
  CityHallBusinessFacade cityHallBusinessFacade = CityHallBusinessFacade();
  final residentRecord1 = "山田太郎";
  final residentRecord2 = "山田次郎";
  print(cityHallBusinessFacade.findAndPrintResidentRecord(residentRecord1));
  print(cityHallBusinessFacade.findAndPrintResidentRecord(residentRecord2));
}

/// 住民情報照合
class ResidentRecordSearch {
  /// 住民情報検索
  bool search(String residentRecord) {
    print("住民情報 '${residentRecord}' を探しています...");

    return residentRecord == "山田太郎";
  }
}

/// 住民票印刷システム
class ResidentRecordPrint {
  /// 住民票印刷
  String printResidentRecord(String residentRecord) {
    print("'${residentRecord}' の住民票を印刷しています...");
    return '${residentRecord}の住民票';
  }
}

/// 市役所業務Facade
class CityHallBusinessFacade {
  /// 検索サブシステム
  late ResidentRecordSearch _searcher;

  /// 印刷サブシステム
  late ResidentRecordPrint _printer;

  /// コンストラクタ
  CityHallBusinessFacade() {
    _searcher = ResidentRecordSearch();
    _printer = ResidentRecordPrint();
  }

  /// 住民票印刷処理
  String findAndPrintResidentRecord(String residentRecord) {
    if (!_searcher.search(residentRecord)) {
      return '該当する住民票がありません';
    }

    return _printer.printResidentRecord(residentRecord);
  }
}
