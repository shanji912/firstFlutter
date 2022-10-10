import 'package:flutter/material.dart';
import 'package:my_flutter/common/localization/string_base.dart';
import 'package:my_flutter/common/localization/string_en.dart';
import 'package:my_flutter/common/localization/string_zh.dart';

///自定义多语言实现
class SaintLocalizations {
  final Locale locale;

  SaintLocalizations(this.locale);

  ///根据不同 locale.languageCode 加载不同语言对应
  ///GSYStringEn和GSYStringZh都继承了GSYStringBase
  static final Map<String, StringBase> _localizedValues = {
    'en': StringEn(),
    'zh': StringZh(),
  };

  StringBase? get currentLocalized {
    if (_localizedValues.containsKey(locale.languageCode)) {
      return _localizedValues[locale.languageCode];
    }
    return _localizedValues["en"];
  }

  ///通过 Localizations 加载当前的 GSYLocalizations
  ///获取对应的 GSYStringBase
  static SaintLocalizations? of(BuildContext context) {
    return Localizations.of(context, SaintLocalizations);
  }

  ///通过 Localizations 加载当前的 GSYLocalizations
  ///获取对应的 GSYStringBase
  static StringBase? i18n(BuildContext context) {
    return (Localizations.of(context, SaintLocalizations) as SaintLocalizations)
        .currentLocalized;
  }
}
