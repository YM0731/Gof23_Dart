void main() {
  CurryCook cook = CurryCook();
  cook.cookCurry(CurryType.mildCurry);
  cook.cookCurry(CurryType.mediumSpicyCurry);
}

/// カレー調理クラス
class CurryCook {
  /// カレー調理
  ///
  /// [curry] カレーの種類
  Curry cookCurry(CurryType curry) {
    switch (curry) {
      case CurryType.mildCurry:
        return MildCurryFactory().cook();
      case CurryType.mediumSpicyCurry:
        return MediumSpicyCurry().cook();
    }
  }
}

/// カレーの種類
enum CurryType {
  /// 甘口
  mildCurry,

  /// 中辛
  mediumSpicyCurry,
}

/// カレークラス
class Curry {
  /// お米を炊く
  String cookingRice;

  /// 具材
  String ingredients;

  /// カレールー
  String curry;

  /// 調味料
  String taste;

  /// ご飯の量
  String riceSize;

  /// コンストラクタ
  ///
  /// [cookingRice] お米を炊く
  ///
  /// [ingredients] 具材
  ///
  /// [curry] カレールー
  ///
  /// [taste] 調味料
  ///
  /// [riceSize] ご飯の量
  Curry({
    required this.cookingRice,
    required this.ingredients,
    required this.curry,
    required this.taste,
    required this.riceSize,
  });
}

/// ----------------------------------------
/// Factory
/// ----------------------------------------
/// カレーFactory基底クラス
abstract class CurryFactory {
  /// カレーを調理
  Curry cook() {
    // お米を炊く
    final addCookingRice = cookingRice();
    // 具材を炒める
    final addIngredients = stirFry();

    // カレールー
    final addCurry = waterAndCurry();

    // 調味料
    final addTaste = taste();

    // ご飯の量
    final addRiceSize = rice();
    return Curry(
      cookingRice: addCookingRice,
      ingredients: addIngredients,
      curry: addCurry,
      taste: addTaste,
      riceSize: addRiceSize,
    );
  }

  /// お米を炊く
  String cookingRice();

  /// 具材を炒める
  String stirFry();

  /// カレールー
  String waterAndCurry();

  /// 調味料
  String taste();

  /// ご飯の量
  String rice();
}

/// 甘口カレーFactory
class MildCurryFactory extends CurryFactory {
  /// お米を炊く
  @override
  String cookingRice() {
    print('通常炊き');
    return '通常炊き';
  }

  /// 具材を炒める
  @override
  String stirFry() {
    print('具材を程よく炒める');
    return '具材を程よく炒める';
  }

  /// カレールー
  @override
  String waterAndCurry() {
    print('甘口ルー');
    return '甘口ルー';
  }

  /// 調味料
  @override
  String taste() {
    print('香辛料多め');
    return '香辛料多め';
  }

  /// ご飯の量
  @override
  String rice() {
    print('ご飯普通盛り');
    return 'ご飯普通盛り';
  }
}

/// 中辛カレーFactory
class MediumSpicyCurry extends CurryFactory {
  /// お米を炊く
  @override
  String cookingRice() {
    print('早炊き');
    return '早炊き';
  }

  /// 具材を炒める
  @override
  String stirFry() {
    print('具材をよく炒める');
    return '具材をよく炒める';
  }

  /// カレールー
  @override
  String waterAndCurry() {
    print('辛口ルー');
    return '辛口ルー';
  }

  /// 調味料
  @override
  String taste() {
    print('香辛料適量');
    return '香辛料適量';
  }

  /// ご飯の量
  @override
  String rice() {
    print('ご飯中盛り');
    return 'ご飯中盛り';
  }
}
