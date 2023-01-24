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
    'v74sh12i': {
      'en': 'Page Title',
      'fr': 'Titre de la page',
    },
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
    'qcy7r67m': {
      'en': 'Account Settings',
      'fr': 'Paramètres du compte',
    },
    'w7kvsp9o': {
      'en': 'Change Password',
      'fr': 'Changer le mot de passe',
    },
    '3rn07fb7': {
      'en': 'Edit Profile',
      'fr': 'Editer le profil',
    },
    'o8wbq9z5': {
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
