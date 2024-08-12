import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ko'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? koText = '',
  }) =>
      [enText, koText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'ioz9a9ra': {
      'en': 'KIDSCOOL',
      'ko': '키즈쿨',
    },
    '1phudcqv': {
      'en': 'First Social App For Kids',
      'ko': '어린이들을 위한 소셜 앱',
    },
    'zxnsedeb': {
      'en':
          'KidsCool is a special app designed to support children\'s growth and brain development.\n\nPrioritizing children\'s safety, KidsCool allows communication only through adding friends, effectively blocking interactions with strangers.\n\nKidsCool offers features that range from managing essential daily tasks to utilizing AI to answer questions and assist with homework. It also includes fun games like sliding puzzles and Candy Crush that stimulate brain activity.\n\nThrough carefully curated content and a safely managed community, KidsCool provides children with a beautiful and enjoyable first social community experience.',
      'ko':
          '키즈쿨은 어린이들의 성장과 두뇌 발달을 돕는 특별한 앱입니다.\n\n어린이들의 안전을 최우선으로 고려하여, 친구 추가를 통해서만 대화를 나눌 수 있도록 하여 낯선 사람과의 소통을 차단합니다.\n\n키즈쿨은 일상에서 꼭 필요한 할 일 관리부터, 인공지능을 활용해 궁금증을 해결하고 숙제를 도와주는 기능까지 제공합니다. 또한, 두뇌 활동을 촉진하는 슬라이딩 퍼즐과 캔디크러시 같은 재미있는 게임 기능도 준비되어 있습니다.\n\n키즈쿨은 엄선된 콘텐츠와 안전하게 관리되는 커뮤니티 활동을 통해 어린이들에게 첫 소셜 커뮤니티 경험을 아름답고 즐겁게 만들어줍니다.',
    },
    'kae2jnfy': {
      'en': 'Home',
      'ko': '',
    },
  },
  // MenuScreen
  {
    'h6b1xg7i': {
      'en': 'Menu',
      'ko': '메뉴',
    },
    '5u6zfo7f': {
      'en': 'Language',
      'ko': '언어',
    },
    'mx9h3exj': {
      'en': 'Choose display language',
      'ko': '언어를 선택하세요.',
    },
    'ykbmq09f': {
      'en': 'en',
      'ko': '',
    },
    '457bin7h': {
      'en': 'English',
      'ko': '영어',
    },
    '3qrdfgna': {
      'en': 'Korean',
      'ko': '한국어',
    },
    '6ebo8lkt': {
      'en': 'Please select...',
      'ko': '언어를 선택 해 주세요.',
    },
    '49d2gks9': {
      'en': 'Search for an item...',
      'ko': '',
    },
    'seahduzx': {
      'en': 'Home',
      'ko': '',
    },
  },
  // Miscellaneous
  {
    'ff0rufm9': {
      'en': '',
      'ko': '',
    },
    '1oe4rbs8': {
      'en': '',
      'ko': '',
    },
    'r9ppcejj': {
      'en': '',
      'ko': '',
    },
    'jac9i9vf': {
      'en': '',
      'ko': '',
    },
    'quu7bn5u': {
      'en': '',
      'ko': '',
    },
    'mxba27h0': {
      'en': '',
      'ko': '',
    },
    '4m5hlu3j': {
      'en': '',
      'ko': '',
    },
    'petewcwj': {
      'en': '',
      'ko': '',
    },
    '17jfzstv': {
      'en': '',
      'ko': '',
    },
    '2xt8orfp': {
      'en': '',
      'ko': '',
    },
    '2es0aujc': {
      'en': '',
      'ko': '',
    },
    'k1953jue': {
      'en': '',
      'ko': '',
    },
    '23pax2si': {
      'en': '',
      'ko': '',
    },
    '4momf9jd': {
      'en': '',
      'ko': '',
    },
    'qj7pwqca': {
      'en': '',
      'ko': '',
    },
    '4job1bbk': {
      'en': '',
      'ko': '',
    },
    'scpcxit2': {
      'en': '',
      'ko': '',
    },
    'xjwq6sbp': {
      'en': '',
      'ko': '',
    },
    'biut8cgi': {
      'en': '',
      'ko': '',
    },
    '8t1plat6': {
      'en': '',
      'ko': '',
    },
    'tb5yqw2w': {
      'en': '',
      'ko': '',
    },
    'e4s52ms6': {
      'en': '',
      'ko': '',
    },
    'p66foaod': {
      'en': '',
      'ko': '',
    },
    '6b99g7vu': {
      'en': '',
      'ko': '',
    },
    'njkai77n': {
      'en': '',
      'ko': '',
    },
  },
].reduce((a, b) => a..addAll(b));
