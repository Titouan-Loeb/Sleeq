import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr'];

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
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
  }) =>
      [enText, frText][languageIndex] ?? '';
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
    'xbzplc4s': {
      'en': 'Home',
      'fr': 'Domicile',
    },
  },
  // Login
  {
    'hagyvfdy': {
      'en': 'Sign In',
      'fr': 'S\'identifier',
    },
    'otvb196v': {
      'en': 'Sign Up',
      'fr': 'S\'inscrire',
    },
    'fqk9zngp': {
      'en': 'Use the form below, to access your account.',
      'fr': 'Utilisez le formulaire ci-dessous, pour accéder à votre compte.',
    },
    'dhggjgkl': {
      'en': 'Your email address',
      'fr': 'Votre adresse e-mail',
    },
    'pbytomsf': {
      'en': 'Password',
      'fr': 'Mot de passe',
    },
    '3xzw8qo5': {
      'en': 'Forgot Password?',
      'fr': 'Mot de passe oublié?',
    },
    'xt2b21lg': {
      'en': 'Login',
      'fr': 'Connexion',
    },
    'ijynuzje': {
      'en': 'Profile',
      'fr': 'Profil',
    },
  },
  // Settings
  {
    'nrfk05ra': {
      'en': 'Profile',
      'fr': 'Profil',
    },
    'vdvhgsru': {
      'en': 'Account Settings',
      'fr': 'Paramètres du compte',
    },
    '2j91mph6': {
      'en': 'Change Password',
      'fr': 'Changer le mot de passe',
    },
    'yso38d4d': {
      'en': 'Edit Profile',
      'fr': 'Editer le profil',
    },
    'oox3aaat': {
      'en': 'Log Out',
      'fr': 'Se déconnecter',
    },
    'wul94o4l': {
      'en': 'Settings',
      'fr': 'Paramètres',
    },
  },
  // SignUp
  {
    'mcquk0sa': {
      'en': 'Sign In',
      'fr': 'S\'identifier',
    },
    '3a46tknc': {
      'en': 'Sign Up',
      'fr': 'S\'inscrire',
    },
    '0ufzn822': {
      'en': 'Get started by creating an account below.',
      'fr': 'Commencez par créer un compte ci-dessous.',
    },
    'sh35p1k7': {
      'en': 'Your email address',
      'fr': 'Votre adresse e-mail',
    },
    's3mww27o': {
      'en': 'Password',
      'fr': 'Mot de passe',
    },
    'hii8oza0': {
      'en': 'Sign up',
      'fr': 'S\'inscrire',
    },
    'owvuefar': {
      'en': 'Profile',
      'fr': 'Profil',
    },
  },
  // ForgotPassword
  {
    'm9ktobmr': {
      'en': 'Forgot password',
      'fr': 'Mot de passe oublié',
    },
    'sjof3rcv': {
      'en': 'You forgot your password ? Shame.',
      'fr': 'Vous avez oublié votre mot de passe ? Honte.',
    },
    'dwpe9xab': {
      'en': 'Your email address',
      'fr': 'Votre adresse e-mail',
    },
    '5r67e7rs': {
      'en': 'Send password reset email',
      'fr': 'Envoyer un e-mail de réinitialisation du mot de passe',
    },
    'om06q9t1': {
      'en': 'Back to login',
      'fr': 'Retour connexion',
    },
    'rj6wygs2': {
      'en': 'Profile',
      'fr': 'Profil',
    },
  },
  // navigation01
  {
    '6hxdkp1s': {
      'en': 'Navigation 01',
      'fr': '',
    },
    '70193utb': {
      'en': 'Top Navigation',
      'fr': '',
    },
    'nelwu3dg': {
      'en':
          'Find some examples of side navigations, copy the elements and use them in your FlutterFlow Projects.',
      'fr': '',
    },
    '8cvcu2dh': {
      'en': 'Home',
      'fr': '',
    },
    'j4sbf73p': {
      'en': 'Chats',
      'fr': '',
    },
    'xqtfuuz8': {
      'en': 'Projects',
      'fr': '',
    },
    'b210zgu0': {
      'en': 'Quick search...',
      'fr': '',
    },
    'r4yizsom': {
      'en': 'Andrew D.',
      'fr': '',
    },
    '38bphb7q': {
      'en': '@andrewd',
      'fr': '',
    },
    'bbkpyuyu': {
      'en': 'Quick search...',
      'fr': '',
    },
    'lxs39vt8': {
      'en': 'Home',
      'fr': '',
    },
    'zoyj3l6e': {
      'en': 'Chats',
      'fr': '',
    },
    'rk3p06ao': {
      'en': 'Projects',
      'fr': '',
    },
    '7c444k54': {
      'en': 'Andrew Daniels',
      'fr': '',
    },
    'a2ah8ycc': {
      'en': '@andrewd',
      'fr': '',
    },
    'r645qa6z': {
      'en': 'Quick search...',
      'fr': '',
    },
    's7wjimql': {
      'en': 'Home',
      'fr': '',
    },
    'c2kx3z46': {
      'en': 'Chats',
      'fr': '',
    },
    'ik90jtob': {
      'en': 'Projects',
      'fr': '',
    },
    '4tudklk0': {
      'en': 'Andrew Daniels',
      'fr': '',
    },
    'w74i11w3': {
      'en': '@andrewd',
      'fr': '',
    },
    '05zguy40': {
      'en': 'Home',
      'fr': '',
    },
    '2lubq4m9': {
      'en': 'Chats',
      'fr': '',
    },
    '3o3pdasn': {
      'en': 'Projects',
      'fr': '',
    },
    'cno9mexz': {
      'en': 'Andrew',
      'fr': '',
    },
    '0aqmnmbl': {
      'en': '@andrewd',
      'fr': '',
    },
    'lushfpiu': {
      'en': 'Side Navigation',
      'fr': '',
    },
    'j8d5yhdr': {
      'en':
          'Find some examples of side navigations, copy the elements and use them in your FlutterFlow Projects.',
      'fr': '',
    },
    'sgepr3lx': {
      'en': '2',
      'fr': '',
    },
    'iaf0g1ei': {
      'en': 'Explore',
      'fr': '',
    },
    'm2yh7ytw': {
      'en': 'Home',
      'fr': '',
    },
    'nfcx7wt1': {
      'en': 'Chats',
      'fr': '',
    },
    'em760c22': {
      'en': 'Projects',
      'fr': '',
    },
    'z3x1ghoh': {
      'en': 'Explore',
      'fr': '',
    },
    'yzy84o5w': {
      'en': '2',
      'fr': '',
    },
    'y9hepmty': {
      'en': 'Primary Navigation',
      'fr': '',
    },
    'ja8hkl5y': {
      'en': 'Home',
      'fr': '',
    },
    'knh365wm': {
      'en': 'Chats',
      'fr': '',
    },
    'g9xm0cmh': {
      'en': 'Activity',
      'fr': '',
    },
    'wtkfmqk4': {
      'en': 'Transactions',
      'fr': '',
    },
    'rut3xogg': {
      'en': 'Spending',
      'fr': '',
    },
    'xitgpmc9': {
      'en': 'Income',
      'fr': '',
    },
    'edz9etx7': {
      'en': 'Admin',
      'fr': '',
    },
    'sjmf1m7k': {
      'en': 'Billing & Payments',
      'fr': '',
    },
    'dh3a9pa1': {
      'en': 'My Account',
      'fr': '',
    },
    '0d1w71vw': {
      'en': 'Andrew D.',
      'fr': '',
    },
    'd6cwv74z': {
      'en': 'Admin',
      'fr': '',
    },
    'd8kowz6z': {
      'en': 'Light Mode',
      'fr': '',
    },
    'cjmw29z3': {
      'en': 'Dark Mode',
      'fr': '',
    },
    'z3jdimn7': {
      'en': 'Home',
      'fr': '',
    },
    'kzjb95uo': {
      'en': 'Chats',
      'fr': '',
    },
    '6clflcqq': {
      'en': 'Projects',
      'fr': '',
    },
    'cp4ha3lp': {
      'en': 'Explore',
      'fr': '',
    },
    'y3jr09x4': {
      'en': 'Light Mode',
      'fr': '',
    },
    'gggxef88': {
      'en': 'Dark Mode',
      'fr': '',
    },
    'bm8f5024': {
      'en': 'Andrew D.',
      'fr': '',
    },
    'ysnoxodi': {
      'en': 'admin@flutterflow.app',
      'fr': '',
    },
    '01essxer': {
      'en': 'View Profile',
      'fr': '',
    },
    'a6dom9av': {
      'en': 'Home',
      'fr': '',
    },
  },
  // Sidebar
  {
    '0xz3kll1': {
      'en': 'Home',
      'fr': '',
    },
    'bi0afuq9': {
      'en': 'Settings',
      'fr': '',
    },
    'q8vbp2qt': {
      'en': 'Light Mode',
      'fr': '',
    },
    '4fsc1wau': {
      'en': 'Dark Mode',
      'fr': '',
    },
    '10py6p4d': {
      'en': 'Logout',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    'p2hrahkk': {
      'en': '',
      'fr': '',
    },
    'vr7e5fdp': {
      'en': '',
      'fr': '',
    },
    't8lau5zg': {
      'en': '',
      'fr': '',
    },
    '7teyqrg6': {
      'en': '',
      'fr': '',
    },
    'rfujsja4': {
      'en': '',
      'fr': '',
    },
    'a5lp0z09': {
      'en': '',
      'fr': '',
    },
    'h4b5z8jl': {
      'en': '',
      'fr': '',
    },
    '3j3qnrq1': {
      'en': '',
      'fr': '',
    },
    'jf8fqx26': {
      'en': '',
      'fr': '',
    },
    '1ctxw08p': {
      'en': '',
      'fr': '',
    },
    'qvjng9ig': {
      'en': '',
      'fr': '',
    },
    'gmre537q': {
      'en': '',
      'fr': '',
    },
    'ukk3b9if': {
      'en': '',
      'fr': '',
    },
    'e7hu7n1v': {
      'en': '',
      'fr': '',
    },
    'nrvg4k7n': {
      'en': '',
      'fr': '',
    },
    'huz9seem': {
      'en': '',
      'fr': '',
    },
    'nj6nqooq': {
      'en': '',
      'fr': '',
    },
    '5cscvx4q': {
      'en': '',
      'fr': '',
    },
    '6w7mrlwr': {
      'en': '',
      'fr': '',
    },
    'iusbi5eg': {
      'en': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
