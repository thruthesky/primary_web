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
    '9m0c6mh4': {
      'en': 'Privacy Policy',
      'ko': '개인정보 보호 정책',
    },
    'mbtnvo9l': {
      'en': 'Contacts',
      'ko': '연락처',
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
    'gisi0dy9': {
      'en': 'Privacy Policy',
      'ko': '개인 정보 보호 정책',
    },
    '1ewjr8ok': {
      'en': '',
      'ko': '',
    },
    'm21as62m': {
      'en': 'Contact',
      'ko': '연락처',
    },
    '6m4lyo0w': {
      'en': '',
      'ko': '',
    },
    'seahduzx': {
      'en': 'Home',
      'ko': '',
    },
  },
  // PrivacyPolicyScreen
  {
    'plggmzyu': {
      'en':
          '<Withcenter> (hereinafter referred to as \"https://sonub.com\") establishes and discloses personal information processing policies as follows to protect personal information of information subjects and to handle related grievances quickly and smoothly pursuant to Article 30 of the Personal Information Protection Act.\n\n○ This personal information processing policy will be applied from December 1, 2022.\n\n\nArticle 1 (Purpose of Processing Personal Information)\n\n<Withcenter> (\"https://sonub.com\") processes personal information for the following purposes: The personal information being processed will not be used for any of the following purposes, and if the purpose of use is changed, necessary measures will be implemented, such as obtaining separate consent under Article 18 of the Personal Information Protection Act.\n\n1. Registering and managing membership on the website\n\nPersonal information is processed for the purpose of confirming your intention to join the membership.\n\n\n2. Providing goods or services\n\nWe process personal information for the purpose of providing services.\n\n\nArticle 2 (Processing and Retaining Period of Personal Information)\n\n① <Withcenter> processes and holds personal information within the period of holding and using personal information under the Act or the period of holding and using personal information agreed upon when collecting personal information from the data subject.\n\n② Each personal information processing and holding period is as follows.\n\n1.<Provide goods or services>\nCollection of personal information related to the provision of goods or services.Held for the above purpose of use from the date of consent for use to <3 years>.It\'s being used.\nGrounds for possession: Records on the handling of consumer complaints or disputes\nRelated Acts and subordinate statutes: Records on the handling of consumer complaints or disputes: 3 years\n\n\nArticle 3 (items of personal information to be processed)\n\n① <Withcenter> is processing the following personal information items:\n\n1<Registration and management of homepage>\nRequired items: Email, mobile phone number, name\nSelection: Gender, Date of Birth\n\n\nArticle 4 (Procedure and Method of Destruction of Personal Information)\n\n\n① <Withcenter> destroys the personal information without delay when personal information becomes unnecessary, such as the lapse of the personal information retention period and the achievement of the purpose of processing.\n\n② If the personal information retention period agreed by the data subject has elapsed or the purpose of processing has been achieved, the personal information shall be transferred to a separate database (DB) or stored in a different storage place.\n\n\n③ The procedures and methods of destroying personal information are as follows.\n1. Destruction procedure\n<Withcenter> selects personal information that causes destruction, and destroys personal information with the approval of <Withcenter>\'s personal information protection manager.\n\n2. Destruction method\n\nInformation in the form of electronic files uses a technical method that cannot be played back\n\n\n\nArticle 5 (Matters concerning the rights and obligations of the information subject and legal representative, and the method of exercising them)\n\n\n\n① The information subject may exercise the right to view, correct, delete, and request suspension of processing personal information at any time.\n\n② The exercise of rights under paragraph (1) can be made in writing, e-mail, facsimile (FAX), etc. in accordance with Article 41 (1) of the Enforcement Decree of the Personal Information Protection Act, and We will take action against it without delay.\n\n③ The exercise of rights under paragraph (1) may be conducted through an agent, such as a legal representative of the information subject or a person entrusted.In such cases, \"Public Notice on the Method of Processing Personal Information (No. 2020-7)\" You must submit a power of attorney in attached Form 11.\n\n④ Requests for access to personal information and suspension of processing may be restricted under Articles 35 (4) and 37 (2) of the Personal Information Protection Act.\n\n⑤ A request for correction and deletion of personal information cannot be requested if the personal information is specified as the subject of collection in other laws and regulations.\n\n⑥ Weissenner verifies whether the person who made the request for perusal, correction and deletion according to the right of the information subject, and inspection when requesting suspension of processing, is the person himself or a legitimate agent.\n\n\n\nArticle 6 (Matters concerning measures to secure the safety of personal information)\n\n<Withcenter> is taking the following measures to ensure the safety of personal information.\n\n1. Establishing and implementing an internal management plan\nFor the safe processing of personal information, an internal management plan is established and implemented.\n\n2. Technical countermeasures against hacking, etc\nTo prevent personal information leakage and damage caused by hacking or computer viruses, <Withcenter> (\'Sonaub\') installs security programs, updates and inspects regularly, and installs systems in areas where access is controlled from outside, and monitors and blocks them technically/physically.\n\n3. Access control for unauthorized persons\nWe have established and operated access control procedures for separately storing personal information.\n\n\n\nArticle 7 (Matters concerning the installation and operation of devices that automatically collect personal information and their refusal)\n\nWeissener does not use \'cookie\', which stores information on the use of information subjects and calls them from time to time.\n\n\nArticle 8 (Matters concerning the collection, use, provision, rejection, etc. of behavioral information)\n\nMatters concerning the collection, use, provision, rejection, etc. of behavioral information;\n\n<Personal Information Controller Name> does not collect, use, or provide behavioral information for online customized advertisements.\n\nArticle 9 (Matters concerning the person in charge of personal information protection)\n\n① Weissener is in charge of personal information processing, and designates a person in charge of personal information protection as follows to handle complaints and remedy damages by information subjects related to personal information processing.\n\n▶ Person in charge of personal information protection\nName: Song Jae-ho\nPosition: Representative\nPosition: Representative\nContact :010-8693-4225, thruthesky@gmail.com\n※ You will be connected to the department responsible for privacy.\n\n▶ Personal Information Protection Department\nDepartment name: Management office\nPerson in charge: Song Jae-ho\n연락처 :010-8693-4225, thruthesky@gmail.com\n② The information subject can contact the person in charge of personal information protection and the department in charge of personal information protection for all personal information protection inquiries, complaints, and damage relief that occurred while using Weissener\'s service (or business). Weissenor will respond and process your inquiry without delay.\n\nArticle 10 (Department that receives and processes requests for access to personal information)\nThe information subject may request the following departments for access to personal information under Article 35 of the ｢ Personal Information Protection Act.\n<Withcenter> will try to expedite the request for access to personal information by the information subject.\n\n\nArticle 11 (Method of remedy for infringement of rights and interests of information subjects)\n\nIn order to receive relief from personal information infringement, information entities can apply for dispute resolution or counseling to the Personal Information Dispute Mediation Committee and the Korea Internet & Security Agency\'s Personal Information Infringement Reporting Center. In addition, please contact the institution below for other reports and consultations on personal information infringement.\n\n1. Personal Information Dispute Mediation Committee: (without national number) 1833-6972 (www.kopico.go.kr)\n2. Personal Information Infringement Reporting Center: 118 (privacy.kisa.or.kr)\n3. Supreme Prosecutors\' Office: 1301 (www.spo.go.kr)\n4. National Police Agency: 182 (ecrm.cyber.go.kr)\n\nA person who has been infringed on his/her rights or interests due to disposition or omission by the head of a public institution in response to a request under Articles 35 (Personal Information Access), 36 (Correction or Deletion of Personal Information, etc.) of the Personal Information Protection Act may request an administrative trial as prescribed by the Administrative Appeals Act.\n\n※ For more information on administrative trials, please refer to the website of the Central Administrative Appeals Commission (www.simpan.go.kr).\n\nArticle 12 (Matters concerning the processing of pseudonymous information in case of processing pseudonymous information)\n\n< Withcenter > processes pseudonymous information for the following purposes.\n\n▶ Purpose of processing pseudonymous information\n\n- Can be written directly.\n\n▶ Processing and retention period of pseudonymous information\n\n- Can be written directly.\n\n▶ Matters concerning the provision of pseudonymous information to third parties (to be completed only if applicable)\n\n- Can be written directly.\n\n▶ Matters concerning consignment of pseudonymous information processing (to be completed only if applicable)\n\n- Can be written directly.\n\n▶ Items of personal information subject to pseudonymization\n\n- Can be written directly.\n\n▶ Matters concerning measures to ensure the safety of pseudonymous information in accordance with Article 28-4 of the Act (duty of safety measures for pseudonymous information, etc.)\n\n- Can be written directly.\n\nArticle 13 (Matters on Person in Charge of Personal Information Protection)\n\n① Withcenter is responsible for overall handling of personal information, and has designated the person in charge of personal information protection as follows to handle complaints and damage relief of information subjects related to personal information processing.\n\n▶ Person in charge of personal information protection\nName: Song Jae-ho\nPosition: Representative\nPosition : Representative\nContact:010-8693-4225, thruthesky@gmail.com,\n※ You will be connected to the department in charge of personal information protection.\n\n\n▶ Department in charge of personal information protection\nDepartment name : Planning\nPerson in charge: Song Jae-ho\nContact:010-8693-4225, thruthesky@gmail.com,\n② The information subject may inquire about personal information protection related inquiries, complaint handling, damage relief, etc. that occurred while using Withcenter\'s service (or business) to the person in charge of personal information protection and the department in charge. Withcenter will respond to and process inquiries from information subjects without delay.\n\nArticle 14 (Department that receives and handles requests for access to personal information)\nThe information subject may request the viewing of personal information in accordance with Article 35 of the Personal Information Protection Act to the following departments.\n< Withcenter > will make efforts to promptly process the personal information access request of the information subject.\n\n▶ Personal information viewing request reception and processing department\nDepartment Name: Administration\nPerson in charge: Song Jae-ho\nContact: 010-8693-4225, thruthesky@gmail.com\n\n\nArticle 15 (Method of Remedy for Infringement of Rights and Interests of Information Subjects)\n\n\n\nThe information subject can apply for dispute resolution or consultation to the Personal Information Dispute Mediation Committee and the Personal Information Infringement Reporting Center of the Korea Internet & Security Agency in order to receive relief from personal information infringement. In addition, please contact the following organizations for reporting or consulting of other personal information infringement.\n\n1. Personal Information Dispute Mediation Committee: (without area code) 1833-6972 (www.kopico.go.kr)\n2. Personal information infringement reporting center: (without area code) 118 (privacy.kisa.or.kr)\n3. Supreme Prosecutors\' Office: (without area code) 1301 (www.spo.go.kr)\n4. National Police Agency: (without area code) 182 (ecrm.cyber.go.kr)\n\nIn response to requests under the provisions of Article 35 (Access to Personal Information), Article 36 (Correction/Deletion of Personal Information), and Article 37 (Suspension of Processing of Personal Information, etc.) of the 「Personal Information Protection Act」, the head of a public institution A person whose rights or interests have been infringed upon due to a disposition or omission may request an administrative appeal in accordance with the Administrative Appeals Act.\n\n※ Please refer to the website of the Central Administrative Appeals Commission (www.simpan.go.kr) for details on administrative adjudication.\n\nArticle 16 (Matters Regarding the Operation and Management of Video Information Processing Devices)\n① <Withcenter> installs and operates the following image information processing devices.\n\n1. Basis/Purpose of Installation of Video Information Processing Equipment: Describes the installation and purpose of the video information processing equipment of <Withcenter>.\n\n2. Number of installations, installation location, shooting range:\nNumber of installations: 1 unit\nInstallation location: front door\nShooting range: Inside the office\n3. Person in charge of management, department in charge, and person with access to image information: Song Jae-ho\n\n4. Video information recording time, storage period, storage location, processing method\nShooting time: 168 hours\nStorage period: 1 week from the time of shooting\nStorage location and processing method: Crowd\n5. How and where to check video information: Mobile phone app\n\n6. Measures against the information subject\'s request, such as viewing video information: Requests for personal image information viewing/existence confirmation must be made, and when the information subject himself/herself is filmed or is clearly necessary for the interests of the information subject\'s life, body, and property Allowed to view for one year\n\n7. Technical, administrative, and physical measures to protect image information:\n\n\n\nArticle 17 (Change of Privacy Policy)\n\n\n① This privacy policy will be applied from November 26, 2022.',
      'ko':
          '< 위세너 >는 「개인정보 보호법」 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다.\n\n○ 이 개인정보처리방침은 2022년 10월 26부터 적용됩니다.\n\n\n제1조(개인정보의 처리 목적)\n\n< 위세너 >는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며 이용 목적이 변경되는 경우에는 「개인정보 보호법」 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.\n\n1. 홈페이지 회원가입 및 관리\n\n회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 서비스 부정이용 방지, 각종 고지·통지 목적으로 개인정보를 처리합니다.\n\n\n2. 재화 또는 서비스 제공\n\n회원과의 소통을 위한 목적으로 개인정보를 처리합니다.\n\n\n3. 마케팅 및 광고에의 활용\n\n신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공 등을 목적으로 개인정보를 처리합니다.\n\n\n\n\n제2조(개인정보의 처리 및 보유 기간)\n\n① < 위세너 >은(는) 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.\n\n② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.\n\n1.<마케팅 및 광고에의 활용>\n<마케팅 및 광고에의 활용>와 관련한 개인정보는 수집.이용에 관한 동의일로부터<3년>까지 위 이용목적을 위하여 보유.이용됩니다.\n보유근거 : 재가입 방지 목적\n관련법령 : 1)신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년\n2) 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년\n3) 대금결제 및 재화 등의 공급에 관한 기록 : 5년\n4) 계약 또는 청약철회 등에 관한 기록 : 5년\n예외사유 :\n\n\n제3조(처리하는 개인정보의 항목)\n\n① < 위세너 >은(는) 다음의 개인정보 항목을 처리하고 있습니다.\n\n1< 홈페이지 회원가입 및 관리 >\n필수항목 : 없음\n선택항목 : 이메일, 이름, 전화번호, 성별, 생년월일\n\n\n제4조(만 14세 미만 아동의 개인정보 처리에 관한 사항)\n\n\n\n① <개인정보처리자명>은(는) 만 14세 미만 아동에 대해 개인정보를 수집할 때 법정대리인의 동의를 얻어 해당 서비스 수행에 필요한 최소한의 개인정보를 수집합니다.\n\n• 필수항목 : 법정 대리인의 성명, 관계, 연락처\n\n② 또한, <개인정보처리자명>의 <처리목적> 관련 홍보를 위해 아동의 개인정보를 수집할 경우에는 법정대리인으로부터 별도의 동의를 얻습니다.\n\n③ <개인정보처리자명>은(는) 만 14세 미만 아동의 개인정보를 수집할 때에는 아동에게 법정대리인의 성명, 연락처와 같이 최소한의 정보를 요구할 수 있으며, 다음 중 하나의 방법으로 적법한 법정대리인이 동의하였는지를 확인합니다.\n\n• 동의 내용을 게재한 인터넷 사이트에 법정대리인이 동의 여부를 표시하도록 하고 개인정보처리자가 그 동의 표시를 확인했음을 법정대리인의 휴대전화 문자 메시지로 알리는 방법\n\n• 동의 내용을 게재한 인터넷 사이트에 법정대리인이 동의 여부를 표시하도록 하고 법정대리인의 신용카드·직불카드 등의 카드정보를 제공받는 방법\n\n• 동의 내용을 게재한 인터넷 사이트에 법정대리인이 동의 여부를 표시하도록 하고 법정대리인의 휴대전화 본인인증 등을 통해 본인 여부를 확인하는 방법\n\n• 동의 내용이 적힌 서면을 법정대리인에게 직접 발급하거나, 우편 또는 팩스를 통하여 전달하고 법정대리인이 동의 내용에 대하여 서명날인 후 제출하도록 하는 방법\n\n• 동의 내용이 적힌 전자우편을 발송하여 법정대리인으로부터 동의의 의사표시가 적힌 전자우편을 전송받는 방법\n\n• 전화를 통하여 동의 내용을 법정대리인에게 알리고 동의를 얻거나 인터넷주소 등 동의 내용을 확인할 수 있는 방법을 안내하고 재차 전화 통화를 통하여 동의를 얻는 방법\n\n• 그 밖에 위와 준하는 방법으로 법정대리인에게 동의 내용을 알리고 동의의 의사표시를 확인하는 방법\n\n\n\n제5조(개인정보의 제3자 제공에 관한 사항)\n\n① < 위세너 >은(는) 개인정보를 제1조(개인정보의 처리 목적)에서 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 「개인정보 보호법」 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.\n\n\n제6조(개인정보의 파기절차 및 파기방법)\n\n\n① < 위세너 > 은(는) 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.\n\n② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.\n1. 법령 근거 :\n2. 보존하는 개인정보 항목 : 계좌정보, 거래날짜\n\n③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.\n1. 파기절차\n< 위세너 > 은(는) 파기 사유가 발생한 개인정보를 선정하고, < 위세너 > 의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.\n\n2. 파기방법\n\n전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다\n\n\n\n제7조(정보주체와 법정대리인의 권리·의무 및 그 행사방법에 관한 사항)\n\n\n\n① 정보주체는 위세너에 대해 언제든지 개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다.\n\n② 제1항에 따른 권리 행사는위세너에 대해 「개인정보 보호법」 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 위세너은(는) 이에 대해 지체 없이 조치하겠습니다.\n\n③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다.이 경우 “개인정보 처리 방법에 관한 고시(제2020-7호)” 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.\n\n④ 개인정보 열람 및 처리정지 요구는 「개인정보 보호법」 제35조 제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.\n\n⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.\n\n⑥ 위세너은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.\n\n\n\n제8조(개인정보의 안전성 확보조치에 관한 사항)\n\n< 위세너 >은(는) 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.\n\n1. 정기적인 자체 감사 실시\n개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.\n\n2. 해킹 등에 대비한 기술적 대책\n<위세너>는 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.\n\n3. 접속기록의 보관 및 위변조 방지\n개인정보처리시스템에 접속한 기록을 최소 1년 이상 보관, 관리하고 있으며,다만, 5만명 이상의 정보주체에 관하여 개인정보를 추가하거나, 고유식별정보 또는 민감정보를 처리하는 경우에는 2년이상 보관, 관리하고 있습니다.\n또한, 접속기록이 위변조 및 도난, 분실되지 않도록 보안기능을 사용하고 있습니다.\n\n4. 개인정보에 대한 접근 제한\n개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.\n\n\n\n\n제9조(개인정보를 자동으로 수집하는 장치의 설치·운영 및 그 거부에 관한 사항)\n\n\n\n① 위세너 은(는) 이용자에게 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용합니다.\n② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다.\n가. 쿠키의 사용 목적 : 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.\n나. 쿠키의 설치•운영 및 거부 : 웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다.\n다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.\n\n\n제10조(행태정보의 수집·이용·제공 및 거부 등에 관한 사항)\n\n\n\n행태정보의 수집·이용·제공 및 거부등에 관한 사항\n\n<개인정보처리자명>은(는) 온라인 맞춤형 광고 등을 위한 행태정보를 수집·이용·제공하지 않습니다.\n\n\n\n제11조(추가적인 이용·제공 판단기준)\n\n< 위세너 > 은(는) ｢개인정보 보호법｣ 제15조제3항 및 제17조제4항에 따라 ｢개인정보 보호법 시행령｣ 제14조의2에 따른 사항을 고려하여 정보주체의 동의 없이 개인정보를 추가적으로 이용·제공할 수 있습니다.\n이에 따라 < 위세너 > 가(이) 정보주체의 동의 없이 추가적인 이용·제공을 하기 위해서 다음과 같은 사항을 고려하였습니다.\n▶ 개인정보를 추가적으로 이용·제공하려는 목적이 당초 수집 목적과 관련성이 있는지 여부\n\n▶ 개인정보를 수집한 정황 또는 처리 관행에 비추어 볼 때 추가적인 이용·제공에 대한 예측 가능성이 있는지 여부\n\n▶ 개인정보의 추가적인 이용·제공이 정보주체의 이익을 부당하게 침해하는지 여부\n\n▶ 가명처리 또는 암호화 등 안전성 확보에 필요한 조치를 하였는지 여부\n\n※ 추가적인 이용·제공 시 고려사항에 대한 판단기준은 사업자/단체 스스로 자율적으로 판단하여 작성·공개함\n\n\n\n제12조(가명정보를 처리하는 경우 가명정보 처리에 관한 사항)\n\n< 위세너 > 은(는) 다음과 같은 목적으로 가명정보를 처리하고 있습니다.\n\n▶ 가명정보의 처리 목적\n\n- 직접작성 가능합니다.\n\n▶ 가명정보의 처리 및 보유기간\n\n- 직접작성 가능합니다.\n\n▶ 가명정보의 제3자 제공에 관한 사항(해당되는 경우에만 작성)\n\n- 직접작성 가능합니다.\n\n▶ 가명정보 처리의 위탁에 관한 사항(해당되는 경우에만 작성)\n\n- 직접작성 가능합니다.\n\n▶ 가명처리하는 개인정보의 항목\n\n- 직접작성 가능합니다.\n\n▶ 법 제28조의4(가명정보에 대한 안전조치 의무 등)에 따른 가명정보의 안전성 확보조치에 관한 사항\n\n- 직접작성 가능합니다.\n\n제13조 (개인정보 보호책임자에 관한 사항)\n\n① 위세너 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.\n\n▶ 개인정보 보호책임자\n성명 :송재호\n직책 :대표\n직급 :대표\n연락처 :010-8693-4225, thruthesky@gmail.com,\n※ 개인정보 보호 담당부서로 연결됩니다.\n\n\n▶ 개인정보 보호 담당부서\n부서명 :기획\n담당자 :송재호\n연락처 :010-8693-4225, thruthesky@gmail.com,\n② 정보주체께서는 위세너 의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 위세너 은(는) 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.\n\n제14조(개인정보의 열람청구를 접수·처리하는 부서)\n정보주체는 ｢개인정보 보호법｣ 제35조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다.\n< 위세너 >은(는) 정보주체의 개인정보 열람청구가 신속하게 처리되도록 노력하겠습니다.\n\n▶ 개인정보 열람청구 접수·처리 부서\n부서명 : 운영\n담당자 : 송재호\n연락처 : 010-8693-4225, thruthesky@gmail.com\n\n\n제15조(정보주체의 권익침해에 대한 구제방법)\n\n\n\n정보주체는 개인정보침해로 인한 구제를 받기 위하여 개인정보분쟁조정위원회, 한국인터넷진흥원 개인정보침해신고센터 등에 분쟁해결이나 상담 등을 신청할 수 있습니다. 이 밖에 기타 개인정보침해의 신고, 상담에 대하여는 아래의 기관에 문의하시기 바랍니다.\n\n1. 개인정보분쟁조정위원회 : (국번없이) 1833-6972 (www.kopico.go.kr)\n2. 개인정보침해신고센터 : (국번없이) 118 (privacy.kisa.or.kr)\n3. 대검찰청 : (국번없이) 1301 (www.spo.go.kr)\n4. 경찰청 : (국번없이) 182 (ecrm.cyber.go.kr)\n\n「개인정보보호법」제35조(개인정보의 열람), 제36조(개인정보의 정정·삭제), 제37조(개인정보의 처리정지 등)의 규정에 의한 요구에 대 하여 공공기관의 장이 행한 처분 또는 부작위로 인하여 권리 또는 이익의 침해를 받은 자는 행정심판법이 정하는 바에 따라 행정심판을 청구할 수 있습니다.\n\n※ 행정심판에 대해 자세한 사항은 중앙행정심판위원회(www.simpan.go.kr) 홈페이지를 참고하시기 바랍니다.\n\n제16조(영상정보처리기기 운영·관리에 관한 사항)\n① < 위세너 >은(는) 아래와 같이 영상정보처리기기를 설치·운영하고 있습니다.\n\n1.영상정보처리기기 설치근거·목적 : < 위세너 >의 영상정보처리기기 설치 및 목적에 대한 내용을 기술합니다.\n\n2.설치 대수, 설치 위치, 촬영 범위 :\n설치대수 : 1 대\n설치위치 : 정문\n촬영범위 : 사무실 내부\n3.관리책임자, 담당부서 및 영상정보에 대한 접근권한자 : 송재호\n\n4.영상정보 촬영시간, 보관기간, 보관장소, 처리방법\n촬영시간 : 168 시간\n보관기간 : 촬영시부터 1주일\n보관장소 및 처리방법 : 크라우드\n5.영상정보 확인 방법 및 장소 : 핸드폰앱\n\n6.정보주체의 영상정보 열람 등 요구에 대한 조치 : 개인영상정보 열람.존재확인 청구서로 신청하여야 하며, 정보주체 자신이 촬영된 경우 또는 명백히 정보주체의 생명.신체.재산 이익을 위해 필요한 경우에 한해 열람을 허용함\n\n7.영상정보 보호를 위한 기술적.관리적.물리적 조치 :\n\n\n\n제17조(개인정보 처리방침 변경)\n\n\n① 이 개인정보처리방침은 2022년 11월 26부터 적용됩니다.\n',
    },
    'sg7e2bfx': {
      'en': 'Privacy Policy',
      'ko': '개인 정보 보호 정책',
    },
    'oibs7isr': {
      'en': 'Home',
      'ko': '',
    },
  },
  // ContactScreen
  {
    'qe5pnhxt': {
      'en': 'Contacts',
      'ko': '연락처',
    },
    '10roa9md': {
      'en': '연락처',
      'ko': '',
    },
    'e5u3wm4u': {
      'en': 'thruthesky@gmail.com',
      'ko': '',
    },
    'z6i3sk6y': {
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
