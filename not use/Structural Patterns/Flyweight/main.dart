/// 名前：フライウェートパターン
/// 実装で使えるか：使えない
/// 内容：
/// インスタンス生成に伴うメモリコストを削減するために利用する

void main() {
  BookFactory factory = BookFactory();
  factory.addBook(title: "Harry Potter", author: "JK Rowling", isBn: "AB123");
  factory.addBook(title: "Harry Potter", author: "JK Rowling", isBn: "AB123");
  factory.addBook(
    title: "To Kill a Mockingbird",
    author: "Harper Lee",
    isBn: "CD345",
  );
  factory.addBook(
    title: "To Kill a Mockingbird",
    author: "Harper Lee",
    isBn: "CD345",
  );
  factory.addBook(
    title: "The Great Gatsby",
    author: "F. Scott Fitzgerald",
    isBn: "EF567",
  );

  final book1 = factory.getBook("AB123");
  final book2 = factory.getBook("AB123");
  final book3 = factory.getBook("CD345");
  final book4 = factory.getBook("EF567");

  print('book1とbook2は${identical(book1, book2)}');
  print('book1とbook3は${identical(book1, book3)}');
  print('book1とbook4は${identical(book1, book4)}');
  print('book2とbook3は${identical(book2, book3)}');
  print('book2とbook4は${identical(book2, book4)}');
  print('book3とbook4は${identical(book3, book4)}');
}

/// 書籍
class Book {
  /// タイトル
  final String title;

  /// 著者
  final String author;

  /// コード
  final String isBn;

  /// コンストラクタ
  ///
  /// [title] タイトル
  ///
  /// [author] 著者
  ///
  /// [isBn] コード
  Book({required this.title, required this.author, required this.isBn});
}

/// ----------------------------------------
/// Factory
/// ----------------------------------------
/// 書籍Factory
class BookFactory {
  /// 書籍
  final Map<String, Book> _bookMap = {};

  /// 書籍追加
  ///
  /// [title] タイトル
  ///
  /// [author] 著者
  ///
  /// [isBn] コード
  void addBook({
    required String title,
    required String author,
    required String isBn,
  }) {
    if (_bookMap.containsKey(isBn)) {
      return;
    }

    final addBook = Book(title: title, author: author, isBn: isBn);
    _bookMap.addEntries({isBn: addBook}.entries);
  }

  /// 書籍取得
  ///
  /// [isBn] コード
  Book getBook(String isBn) {
    if (!_bookMap.containsKey(isBn)) {
      throw Exception();
    }

    return _bookMap[isBn]!;
  }
}
