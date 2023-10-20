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
    String? frText = '',
  }) =>
      [enText, frText][languageIndex] ?? '';

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
    'yjm0b1dl': {
      'en': 'Grid View',
      'fr': 'Vue Grille',
    },
    'xbzplc4s': {
      'en': 'Home',
      'fr': 'Acceuil',
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
    '0oxsulyr': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'q8d3ybbp': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '2heekiw9': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'mjtse7a3': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ijynuzje': {
      'en': 'Profile',
      'fr': 'Profil',
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
    'cjp45jcm': {
      'en': 'Contain at least one lower case',
      'fr': 'Contient au moins une minuscule',
    },
    'xive8gvg': {
      'en': 'Contain at least one number',
      'fr': 'Contient au moins un chiffre',
    },
    'av7mvuec': {
      'en': 'Contain at least one special character',
      'fr': 'Contient au moins un caractère spécial',
    },
    '0haqu219': {
      'en': 'Contain at least one upper case',
      'fr': 'Contient au moins une majuscule',
    },
    '20pmuh66': {
      'en': 'Confirm Password',
      'fr': 'Confirmez le mot de passe',
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
  // Settings
  {
    '8bi0er89': {
      'en': 'Settings',
      'fr': 'Paramètres',
    },
    '9z09qn2f': {
      'en': 'About Sleeq',
      'fr': 'À propos de Sleeq',
    },
    '9rby2k2i': {
      'en': 'Account',
      'fr': 'Compte',
    },
    '7ehz86gs': {
      'en': 'Profile',
      'fr': 'Profil',
    },
    'km7rsucg': {
      'en': 'Send feedback',
      'fr': 'Envoyer des commentaires',
    },
    'mrewls1p': {
      'en': 'Report a bug',
      'fr': 'Signaler un bug',
    },
    'wurg3p18': {
      'en': 'Home',
      'fr': 'Acceuil',
    },
  },
  // folders
  {
    'w9d5ah2c': {
      'en': 'Grid View',
      'fr': 'Vue Grille',
    },
    'n0ze2vmk': {
      'en': 'Home',
      'fr': 'Acceuil',
    },
  },
  // examplePage
  {
    'rc9x2s09': {
      'en': 'Home',
      'fr': 'Domicile',
    },
  },
  // file
  {
    'frc8wftl': {
      'en': 'Home',
      'fr': 'Domicile',
    },
  },
  // TestOnBoarding
  {
    'izm7zh7t': {
      'en': 'Store documents',
      'fr': 'Stockez vos documents',
    },
    'fr6bdly0': {
      'en': 'A way to store any type of your documents.',
      'fr': 'Un moyen de stocker tout type de documents.',
    },
    'l6t1c76m': {
      'en': 'Retrieve Documents',
      'fr': 'Accédez à vos documents',
    },
    'g3lblqub': {
      'en': 'access to all your documents anywhere and on any devices.',
      'fr': 'Accédez à vos documents partout et sur tout vos appareils.',
    },
    '583of6kn': {
      'en': 'For any situation',
      'fr': 'Dans toutes les situations',
    },
    'fq1sirxh': {
      'en':
          'Retrieve your documents for your travels, your payments, your mobility, and more!',
      'fr':
          'Accéder à vos documents de voyage, pour vos paiements, votre mobilité et autres!',
    },
    'f6g0wm12': {
      'en': 'Continue',
      'fr': 'Continuer',
    },
  },
  // Account
  {
    'cqkkoltm': {
      'en': 'Account',
      'fr': 'Compte',
    },
    'py7rjozc': {
      'en': 'Storage',
      'fr': 'Stockage',
    },
    'kxhmi35j': {
      'en': '0 MB / 250 MB',
      'fr': '0 Mo / 250 Mo',
    },
    'eakvdt9z': {
      'en': 'Subscription plan',
      'fr': 'Formule d\'abonnement',
    },
    'vo5wj9ol': {
      'en': 'Delete account',
      'fr': 'Supprimer le compte',
    },
    '4ffv07yn': {
      'en': 'Reset password',
      'fr': 'Réinitialiser le mot de passe',
    },
    'nc10hive': {
      'en': 'Send feedback',
      'fr': 'Envoyer des commentaires',
    },
    '75lt2syf': {
      'en': 'Report a bug',
      'fr': 'Signaler un bug',
    },
    'zp5l6n6u': {
      'en': 'Settings',
      'fr': 'Paramètres',
    },
  },
  // Profile
  {
    'ny0ab5ej': {
      'en': 'Profile',
      'fr': 'Profil',
    },
    'r5sbc1ic': {
      'en': 'Your Name',
      'fr': 'votre nom',
    },
    '1i7iv9i5': {
      'en': 'Enable color blindness',
      'fr': '',
    },
    'zcqg28jj': {
      'en': 'Change photo',
      'fr': 'Changer la photo',
    },
    'zldhyf21': {
      'en': 'Save Changes',
      'fr': 'Sauvegarder',
    },
    '8z9vjqdr': {
      'en': 'Logout',
      'fr': 'Se déconnecter',
    },
    'r41az8sf': {
      'en': 'Settings',
      'fr': 'Acceuil',
    },
  },
  // PlanSelection
  {
    'tq6yi8cb': {
      'en': 'Subscribe',
      'fr': 'S\'abonner',
    },
    'etkn3ot2': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // Memo
  {
    '87ckfjne': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // AboutSleeq
  {
    'ywfrk2c5': {
      'en': 'About Sleeq',
      'fr': 'Profil',
    },
    'qojrk86o': {
      'en': 'Our Project',
      'fr': 'Notre projet',
    },
    '0filyxh2': {
      'en':
          'We are a team of 9 developers incubated at EPITECH (Paris Graduate School of Digital Innovation).\nSleeq originated within our Masters program and has been continiously in development since November 2021.\nThe pandemic taught us our world is getting increasingly digital out of need.\n\nWe at Sleeq want that change to be as simple as digitalizing the full contents of your wallet while ensuring you retain the safety and comfort feeling of having everything everywhere with you.\n\nSleek. Reliable. Secure.\nSleeq replace the physical wallet with a digital wallet which can store all the document you want in one place or several place like in your phone or your computer\nThanks to Sleeq it is possible to transfer your documents securely and quickly between devices of different platforms.',
      'fr':
          'Nous sommes une équipe de 9 développeurs incubés à l\'EPITECH (Paris Graduate School of Digital Innovation).\nSleeq est né au sein de notre programme de maîtrise et est en développement continu depuis novembre 2021.\nLa pandémie nous a appris que notre monde devient de plus en plus numérique par nécessité.\n\nChez Sleeq, nous voulons que ce changement soit aussi simple que de numériser tout le contenu de votre portefeuille tout en vous assurant de conserver le sentiment de sécurité et de confort d\'avoir tout partout avec vous.\n\nLisse. Fiable. Sécurisé.\nSleeq remplace le portefeuille physique par un portefeuille numérique qui peut stocker tous les documents que vous voulez à un ou plusieurs endroits comme dans votre téléphone ou votre ordinateur\nGrâce à Sleeq, il est possible de transférer vos documents en toute sécurité et rapidement entre des appareils de différentes plateformes.',
    },
    'j7x640he': {
      'en': 'Our Team',
      'fr': 'Notre équipe',
    },
    'uwy1pkya': {
      'en': 'Mathieu\nBretrandy',
      'fr': 'Matthieu\nBretagne',
    },
    '2sht2n2s': {
      'en': 'Ilan\nBenarroche',
      'fr': 'Ilan\nBénarroche',
    },
    'gdigf6jw': {
      'en': 'Julien\nFumey',
      'fr': 'Julien\nFumée',
    },
    'owqht94o': {
      'en': 'Arsene\nMathieu',
      'fr': 'Arsène\nMatthieu',
    },
    'a0gj0cad': {
      'en': 'Hugo\nDomingues',
      'fr': 'Hugo\nDomingues',
    },
    '1dft3co8': {
      'en': 'Titouan\nLoeb',
      'fr': 'Titouan\nLoeb',
    },
    'muka298r': {
      'en': 'Thomas\nCamlong',
      'fr': 'Thomas\nCamlong',
    },
    '3dp7q37p': {
      'en': 'Vasco\nRibeiro',
      'fr': 'Vasco\nRibeiro',
    },
    'j9gng7ma': {
      'en': 'Settings',
      'fr': 'Acceuil',
    },
  },
  // fileInformations
  {
    '90d8n39p': {
      'en': 'Informations',
      'fr': 'Informations',
    },
    'a1iqw8rl': {
      'en': 'Name :',
      'fr': 'Nom :',
    },
    'cqydfgnk': {
      'en': 'File Name',
      'fr': 'Nom de fichier',
    },
    'uiuo94s4': {
      'en': 'Type :',
      'fr': 'Taper :',
    },
    '1nb12l3g': {
      'en': '.pdf',
      'fr': '.pdf',
    },
    '3uh5ik4j': {
      'en': 'Size :',
      'fr': 'Taille :',
    },
    '0hsomtgg': {
      'en': '20 MB',
      'fr': '20 Mo',
    },
    'vn5bzht6': {
      'en': 'Creation Date',
      'fr': 'Date de création',
    },
    'ycbwmqug': {
      'en': 'May 23, 2023 - 14:33',
      'fr': '23 mai 2023 - 14:33',
    },
    'otyglnx0': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // successfulPayment
  {
    'osa4t63e': {
      'en': 'Payment successful',
      'fr': 'Paiement réussi',
    },
    'gi4un8ri': {
      'en': 'Go back to home page',
      'fr': 'Retournez à la page d\'accueil',
    },
    'qgnp7enp': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // cancelPayment
  {
    'yrbqd3sp': {
      'en': 'Operation canceled',
      'fr': 'Opération annulée',
    },
    'izx9kxnr': {
      'en': 'Try again',
      'fr': 'Essayer à nouveau',
    },
    'vamm422r': {
      'en': 'Go back to home page',
      'fr': 'Retournez à la page d\'accueil',
    },
    'rqlcinw0': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // feedback
  {
    'wwoo368v': {
      'en': 'Feedback Form',
      'fr': 'Formulaire de commentaires',
    },
    '13ywdpbd': {
      'en': 'Please provide your feedback on the Sleeq beta program.',
      'fr':
          'Veuillez nous faire part de vos commentaires sur le programme bêta de Sleeq.',
    },
    '3udtpuuu': {
      'en': 'Rate the following points:',
      'fr': 'Évaluez les points suivants :',
    },
    'uix9u6au': {
      'en': 'Ease of Use',
      'fr': 'Facilité d\'utilisation',
    },
    'fyczl56s': {
      'en': 'Quality of Features',
      'fr': 'Qualité des fonctionnalités',
    },
    'g5ceztgx': {
      'en': 'Bug-Free App',
      'fr': 'Application sans bogue',
    },
    '8ffs53fz': {
      'en': 'Price of Subscription Models',
      'fr': 'Prix ​​des modèles d\'abonnement',
    },
    'xe1lwdot': {
      'en': 'Have you considered paying for premium?',
      'fr': 'Avez-vous pensé à payer une prime ?',
    },
    'bri2xpoq': {
      'en': 'Reason for not considering premium',
      'fr': 'Raison de ne pas considérer la prime',
    },
    '5085jd2h': {
      'en': 'Enter reason here...',
      'fr': 'Entrez la raison ici...',
    },
    'gxykgt96': {
      'en': 'Other Comments',
      'fr': 'Autres commentaires',
    },
    'ycq6iivk': {
      'en': 'Enter any additional comments here...',
      'fr': 'Entrez tout commentaire supplémentaire ici...',
    },
    'mc303noe': {
      'en': 'Submit',
      'fr': 'Soumettre',
    },
  },
  // bugReport
  {
    'zezqvldl': {
      'en': 'Bug report form',
      'fr': 'Formulaire de commentaires',
    },
    'elbpjfvc': {
      'en': 'Enter title',
      'fr': '',
    },
    'edv6fzu8': {
      'en': 'Bug Description',
      'fr': 'Description du bogue',
    },
    'ap7gnrbf': {
      'en': 'Enter bug description...',
      'fr': 'Entrez la description du bogue...',
    },
    't6mqh36z': {
      'en': 'Steps to reproduce',
      'fr': 'Étapes à reproduire',
    },
    'ygq00bnb': {
      'en': '1 - Open the app\n2 - Upload a file\n3 - Phone explodes',
      'fr':
          '1 - Ouvrez l\'application\n2 - Télécharger un fichier\n3 - Le téléphone explose',
    },
    'xb00grmv': {
      'en': 'Priority',
      'fr': 'Priorité',
    },
    'qp87fhb6': {
      'en': 'Low',
      'fr': 'Faible',
    },
    'gr2kdfkg': {
      'en': 'Medium',
      'fr': 'Moyen',
    },
    'qt3ecft4': {
      'en': 'High',
      'fr': 'Haut',
    },
    'j4e1rll7': {
      'en': 'Low',
      'fr': '',
    },
    'bbphpqhx': {
      'en': 'Notify me of bug fixing progress',
      'fr': 'M\'avertir de l\'avancement de la correction des bogues',
    },
    'enbd6m6b': {
      'en': 'Submit',
      'fr': 'Soumettre',
    },
    'utj1v8yv': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'j2zpgopp': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'dirnw166': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'vj0xplg2': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'qil3j9od': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    '7gjegoou': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // Termsandconditions
  {
    '5vavpscf': {
      'en': 'Terms and Conditions',
      'fr': '',
    },
    'u3ax0yju': {
      'en':
          'By using this app, you agree to the following terms and conditions:',
      'fr': '',
    },
    '2loqfytx': {
      'en': '1. Data Responsibility:',
      'fr': '',
    },
    '5j4o9o7w': {
      'en':
          'You are solely responsible for the data you upload to this app. We do not take responsibility for any lost or corrupted data.',
      'fr': '',
    },
    'dtbvv7cw': {
      'en': '2. Refunds:',
      'fr': '',
    },
    'raob6rrp': {
      'en':
          'Refunds are not allowed after using the premium plan for more than 1 week of the paid-for validity.',
      'fr': '',
    },
    '7lqc5new': {
      'en': 'I acknowledge and agree to the Terms and Conditions',
      'fr': '',
    },
    'hhdh2qja': {
      'en': 'Accept',
      'fr': '',
    },
  },
  // MoveSmarphonePage
  {
    '6jmjajlj': {
      'en': 'Move selected elements',
      'fr': '',
    },
    'pdzxr0bo': {
      'en': 'Home',
      'fr': '',
    },
  },
  // CopyPasteSmarphonePage
  {
    '7iwe6ghx': {
      'en': 'Paste selected elements',
      'fr': '',
    },
    'tym50gvi': {
      'en': 'Home',
      'fr': '',
    },
  },
  // search
  {
    '1qh4c4pz': {
      'en': 'Edit Header 1',
      'fr': '',
    },
    'c0bd5b9s': {
      'en': 'Edit Header 2',
      'fr': '',
    },
    '4l9jvtay': {
      'en': 'Edit Column 1',
      'fr': '',
    },
    'z30dokjd': {
      'en': 'Edit Column 2',
      'fr': '',
    },
    '6gy37qi1': {
      'en': 'Home',
      'fr': '',
    },
  },
  // fileCard
  {
    '7hms8kmo': {
      'en': 'Home',
      'fr': 'Domicile',
    },
  },
  // newnav
  {
    '6dt9sj2x': {
      'en': 'Home',
      'fr': 'Acceuil',
    },
    'rdg8q5en': {
      'en': 'Settings',
      'fr': 'Paramètres',
    },
    'joolq3hb': {
      'en': 'Upload a file',
      'fr': 'Télécharger un fichier',
    },
    'wzfdn71s': {
      'en': 'Light Mode',
      'fr': 'Mode lumière',
    },
    'b82qzcwq': {
      'en': 'Dark Mode',
      'fr': 'Mode sombre',
    },
    'ho44eh4t': {
      'en': 'Logout',
      'fr': 'Se déconnecter',
    },
  },
  // addModal
  {
    'fqrx409d': {
      'en': 'Folder',
      'fr': 'Dossier',
    },
    'pzkk6o4a': {
      'en': 'File',
      'fr': 'Fichier',
    },
    'sn3q0avy': {
      'en': 'Folder name',
      'fr': 'Nom de dossier',
    },
    'r4n3gt7h': {
      'en': '[folder name]',
      'fr': '[nom de dossier]',
    },
    'vb8p8k2k': {
      'en': 'File name',
      'fr': 'Nom de fichier',
    },
    't1jrn4o0': {
      'en': '[file.pdf]',
      'fr': '[fichier.pdf]',
    },
    'j7nwknqr': {
      'en': 'Cancel',
      'fr': 'Annuler',
    },
  },
  // RenameFolderDialog
  {
    '62s1el54': {
      'en': 'Rename',
      'fr': 'Renommer',
    },
    'gx7f6c8b': {
      'en': 'Enter the new name below',
      'fr': 'Entrez le nouveau nom ci-dessous',
    },
    'b7er5pp3': {
      'en': 'Label here...',
      'fr': '',
    },
    'kds0ysdx': {
      'en': 'Confirm',
      'fr': 'Confirmer',
    },
  },
  // resetPasswordPopup
  {
    '6yzjenu9': {
      'en':
          'You are going to reset your password. You will reveive a link to your email address to define a new password. Are you sure you wan tot continue?',
      'fr':
          'Vous êtes sur le point de réinitialiser votre mot de passe. Vous recevrez un lien vers votre adresse email pour définir un nouveau mot de passe. Voulez-vous vraiment continuer ?',
    },
    't9ut0v9p': {
      'en': 'Confirm',
      'fr': 'Confirmer',
    },
    'zommix2i': {
      'en': 'Cancel',
      'fr': 'Annuler',
    },
  },
  // deleteAccountPopup
  {
    'u1s9gb89': {
      'en':
          'You are going to delete your account. You will loose every document saved on this account. Are you sure you wan tot continue?',
      'fr':
          'Vous êtes sur le point de supprimer votre compte. Vous perdrez tous les documents enregistrés sur ce compte. Voulez-vous vraiment continuer ?',
    },
    '8k8mcj7g': {
      'en': 'Confirm',
      'fr': 'Confirmer',
    },
    '20zuwi5m': {
      'en': 'Cancel',
      'fr': 'Annuler',
    },
  },
  // PremiumPlanWidget
  {
    'wszriotl': {
      'en': 'Sleeq Starter',
      'fr': 'Démarreur élégant',
    },
    '4rajon4b': {
      'en': 'To discover Sleeq',
      'fr': 'Pour découvrir Sleeq',
    },
    '8t5z5mb2': {
      'en': 'Free',
      'fr': 'Gratuit',
    },
    'o6ckrkk7': {
      'en': 'Category',
      'fr': 'Catégorie',
    },
    'lfwhoe3f': {
      'en': 'Included documents',
      'fr': 'Documents inclus',
    },
    'sad5z4i4': {
      'en': 'You can store up to 50 documents',
      'fr': 'Vous pouvez stocker jusqu\'à 50 documents',
    },
    '68clqyq9': {
      'en': '50',
      'fr': '50',
    },
    '8w5xedmx': {
      'en': 'Max document size',
      'fr': 'Taille maximale du document',
    },
    'yb9wz2vc': {
      'en': 'Your documents can weigh up to 5 MB each',
      'fr': 'Vos documents peuvent peser jusqu\'à 5 Mo chacun',
    },
    'd0v2otpl': {
      'en': 'Access from',
      'fr': 'Accès depuis',
    },
    '4x4gjabo': {
      'en': 'Smartphone',
      'fr': 'Téléphone intelligent',
    },
    'e9v9j74e': {
      'en': 'Access and upload you documents from a smartphone',
      'fr': 'Accéder et télécharger vos documents depuis un smartphone',
    },
    '10p2rw7v': {
      'en': '5 MD',
      'fr': '5 MD',
    },
    'pic8v1y0': {
      'en': 'Computer',
      'fr': 'Ordinateur',
    },
    '9anzvjk1': {
      'en': 'Access and upload you documents from a computer',
      'fr': 'Accéder et télécharger vos documents depuis un ordinateur',
    },
    '29is3om7': {
      'en': 'Import from',
      'fr': 'Importer de',
    },
    'fpboc445': {
      'en': 'Folder',
      'fr': 'Dossier',
    },
    'ieu222cg': {
      'en': 'Import documents from your folder',
      'fr': 'Importer des documents depuis votre dossier',
    },
    'p5mm061p': {
      'en': 'Camera',
      'fr': 'Caméra',
    },
    'b5m39m8j': {
      'en': 'Import documents using the camera',
      'fr': 'Importer des documents à l\'aide de l\'appareil photo',
    },
    'xzt8xhue': {
      'en': 'Optical Character Recognition ',
      'fr': 'Reconnaissance optique de caractères',
    },
    'eebhi0sm': {
      'en': 'Apply optical character recognition on your documents ',
      'fr':
          'Appliquez la reconnaissance optique des caractères sur vos documents',
    },
    '2wtmltbr': {
      'en': 'Export to',
      'fr': 'Exporter vers',
    },
    'mlb6waad': {
      'en': 'Folder',
      'fr': 'Dossier',
    },
    'vqhzst3f': {
      'en': 'Import documents from your folder',
      'fr': 'Importer des documents depuis votre dossier',
    },
    'a29pwlsz': {
      'en': 'Email',
      'fr': 'E-mail',
    },
    'xcjxosiq': {
      'en': 'Export documents to your emails',
      'fr': 'Exportez des documents vers vos e-mails',
    },
    'y2qj1noi': {
      'en': 'Calender ',
      'fr': 'Calandre',
    },
    'nyykm8u8': {
      'en': 'Export your documents to your calender',
      'fr': 'Exportez vos documents vers votre calendrier',
    },
    'qufqp7tj': {
      'en': 'Wallet',
      'fr': 'Portefeuille',
    },
    'io0mi4cj': {
      'en': 'Export your documents to your wallet',
      'fr': 'Exportez vos documents vers votre portefeuille',
    },
    'bpbbm6wl': {
      'en': 'Personalization',
      'fr': 'Personnalisation',
    },
    'x1brjyyg': {
      'en': 'Document Categories',
      'fr': 'Catégories de documents',
    },
    'd5hauf5b': {
      'en': 'You only have access to the default categories',
      'fr': 'Vous n\'avez accès qu\'aux catégories par défaut',
    },
    'jlc4kmb0': {
      'en': 'Default',
      'fr': 'Défaut',
    },
    '59gdkv6i': {
      'en': 'Customization',
      'fr': 'Personnalisation',
    },
    '0jf6bl68': {
      'en': 'You can customize and organize your folder as desired',
      'fr':
          'Vous pouvez personnaliser et organiser votre dossier comme vous le souhaitez',
    },
    '89az1hd7': {
      'en': 'Widget',
      'fr': 'Widget',
    },
    'tjmhlsuw': {
      'en': 'You get Sleeq widget for your home screen',
      'fr': 'Vous obtenez le widget Sleeq pour votre écran d\'accueil',
    },
  },
  // PlanStarter
  {
    'fp935rcz': {
      'en': 'Sleeq Starter',
      'fr': 'Démarreur élégant',
    },
    'dg89lsg2': {
      'en': 'To discover Sleeq',
      'fr': 'Pour découvrir Sleeq',
    },
    'ic1dy8nm': {
      'en': 'Free',
      'fr': 'Gratuit',
    },
    'ughm3d26': {
      'en': 'Category',
      'fr': 'Catégorie',
    },
    'v1l58n13': {
      'en': 'Included documents',
      'fr': 'Documents inclus',
    },
    'qx0f5cez': {
      'en': 'You can store up to 50 documents',
      'fr': 'Vous pouvez stocker jusqu\'à 50 documents',
    },
    'efwqajeu': {
      'en': '50',
      'fr': '50',
    },
    's3b57yn8': {
      'en': 'Max document size',
      'fr': 'Taille maximale du document',
    },
    'oat9dg9z': {
      'en': 'Your documents can weigh up to 5 MB each',
      'fr': 'Vos documents peuvent peser jusqu\'à 5 Mo chacun',
    },
    'kcqdjcow': {
      'en': 'Access from',
      'fr': 'Accès depuis',
    },
    'pfm33szy': {
      'en': 'Smartphone',
      'fr': 'Téléphone intelligent',
    },
    'b20kcrn9': {
      'en': 'Access and upload you documents from a smartphone',
      'fr': 'Accéder et télécharger vos documents depuis un smartphone',
    },
    'lm3gfmhr': {
      'en': '5 MD',
      'fr': '5 MD',
    },
    '5qq2fp7e': {
      'en': 'Computer',
      'fr': 'Ordinateur',
    },
    '2719e7v5': {
      'en': 'Access and upload you documents from a computer',
      'fr': 'Accéder et télécharger vos documents depuis un ordinateur',
    },
    'v4kfhhbg': {
      'en': 'Import from',
      'fr': 'Importer de',
    },
    'isjwh9iw': {
      'en': 'Folder',
      'fr': 'Dossier',
    },
    '94k6qg9i': {
      'en': 'Import documents from your folder',
      'fr': 'Importer des documents depuis votre dossier',
    },
    'hz1h1il8': {
      'en': 'Camera',
      'fr': 'Caméra',
    },
    '9y3y4dz4': {
      'en': 'Import documents using the camera',
      'fr': 'Importer des documents à l\'aide de l\'appareil photo',
    },
    '79vvaz6t': {
      'en': 'Optical Character Recognition ',
      'fr': 'Reconnaissance optique de caractères',
    },
    'd256rrvh': {
      'en': 'Apply optical character recognition on your documents ',
      'fr':
          'Appliquez la reconnaissance optique des caractères sur vos documents',
    },
    'nujgw3s8': {
      'en': 'Export to',
      'fr': 'Exporter vers',
    },
    'wg6ohby7': {
      'en': 'Folder',
      'fr': 'Dossier',
    },
    'w2siv5ep': {
      'en': 'Import documents from your folder',
      'fr': 'Importer des documents depuis votre dossier',
    },
    'jfxwhvz6': {
      'en': 'Email',
      'fr': 'E-mail',
    },
    'pf68lbmm': {
      'en': 'Export documents to your emails',
      'fr': 'Exportez des documents vers vos e-mails',
    },
    'qoo51h08': {
      'en': 'Calender ',
      'fr': 'Calandre',
    },
    'gi13s1g6': {
      'en': 'Export your documents to your calender',
      'fr': 'Exportez vos documents vers votre calendrier',
    },
    'a3a3w3oa': {
      'en': 'Wallet',
      'fr': 'Portefeuille',
    },
    'wn1wsesm': {
      'en': 'Export your documents to your wallet',
      'fr': 'Exportez vos documents vers votre portefeuille',
    },
    '4aw39xdb': {
      'en': 'Personalization',
      'fr': 'Personnalisation',
    },
    'drhhlq0t': {
      'en': 'Document Categories',
      'fr': 'Catégories de documents',
    },
    '35skgmd7': {
      'en': 'You only have access to the default categories',
      'fr': 'Vous n\'avez accès qu\'aux catégories par défaut',
    },
    '5x0ddgo9': {
      'en': 'Default',
      'fr': 'Défaut',
    },
    'a4bhykzt': {
      'en': 'Customization',
      'fr': 'Personnalisation',
    },
    'ebfjw0sy': {
      'en': 'You can customize and organize your folder as desired',
      'fr':
          'Vous pouvez personnaliser et organiser votre dossier comme vous le souhaitez',
    },
    'q0pgfmx4': {
      'en': 'Widget',
      'fr': 'Widget',
    },
    'w7hr1p51': {
      'en': 'You get Sleeq widget for your home screen',
      'fr': 'Vous obtenez le widget Sleeq pour votre écran d\'accueil',
    },
  },
  // PlanOpen
  {
    'b4jn9bha': {
      'en': 'Sleeq Open',
      'fr': 'Sleeq ouvert',
    },
    '61mzqpdg': {
      'en': 'Unlock the full experience',
      'fr': 'Débloquez l\'expérience complète',
    },
    'zk9xb0w0': {
      'en': '14.99 € per month',
      'fr': '14,99 € par mois',
    },
    'pvdrd7ch': {
      'en': 'Category',
      'fr': 'Catégorie',
    },
    'dka100fn': {
      'en': 'Included documents',
      'fr': 'Documents inclus',
    },
    'obbaumkr': {
      'en': 'You can store as many documents as desired',
      'fr': 'Vous pouvez stocker autant de documents que vous le souhaitez',
    },
    'hj77cnkj': {
      'en': '∞',
      'fr': '∞',
    },
    '58x4vrlf': {
      'en': 'Max document size',
      'fr': 'Taille maximale du document',
    },
    '4pa4hi28': {
      'en': 'Your documents can weigh up to 100 MB each',
      'fr': 'Vos documents peuvent peser jusqu\'à 100 Mo chacun',
    },
    'bz0f9xv9': {
      'en': 'Access from',
      'fr': 'Accès depuis',
    },
    'gie9ruzr': {
      'en': 'Smartphone',
      'fr': 'Téléphone intelligent',
    },
    'b6gvdeb4': {
      'en': 'Access and upload you documents from a smartphone',
      'fr': 'Accéder et télécharger vos documents depuis un smartphone',
    },
    'duzazgdm': {
      'en': '5 MD',
      'fr': '5 MD',
    },
    'bzyoln4t': {
      'en': 'Computer',
      'fr': 'Ordinateur',
    },
    'd3b2k42e': {
      'en': 'Access and upload you documents from a computer',
      'fr': 'Accéder et télécharger vos documents depuis un ordinateur',
    },
    'l4yfa6xk': {
      'en': 'Import from',
      'fr': 'Importer de',
    },
    'k0lf19cl': {
      'en': 'Folder',
      'fr': 'Dossier',
    },
    'vl2i1l17': {
      'en': 'Import documents from your folder',
      'fr': 'Importer des documents depuis votre dossier',
    },
    'ngqru57y': {
      'en': 'Camera',
      'fr': 'Caméra',
    },
    'mo327zsy': {
      'en': 'Import documents using the camera',
      'fr': 'Importer des documents à l\'aide de l\'appareil photo',
    },
    '5kfiiclg': {
      'en': 'Optical Character Recognition ',
      'fr': 'Reconnaissance optique de caractères',
    },
    '8w9e2tv8': {
      'en': 'Apply optical character recognition on your documents ',
      'fr':
          'Appliquez la reconnaissance optique des caractères sur vos documents',
    },
    '2ja7c6ur': {
      'en': 'Export to',
      'fr': 'Exporter vers',
    },
    '1vfv7yth': {
      'en': 'Folder',
      'fr': 'Dossier',
    },
    '9hdefl1j': {
      'en': 'Import documents from your folder',
      'fr': 'Importer des documents depuis votre dossier',
    },
    'xxf0kc0t': {
      'en': 'Email',
      'fr': 'E-mail',
    },
    '8ve2ka4m': {
      'en': 'Export documents to your emails',
      'fr': 'Exportez des documents vers vos e-mails',
    },
    'hshs3fv2': {
      'en': 'Calender ',
      'fr': 'Calandre',
    },
    'y0mwige5': {
      'en': 'Export your documents to your calender',
      'fr': 'Exportez vos documents vers votre calendrier',
    },
    'rf73hlkl': {
      'en': 'Wallet',
      'fr': 'Portefeuille',
    },
    'w4mrohhg': {
      'en': 'Export your documents to your wallet',
      'fr': 'Exportez vos documents vers votre portefeuille',
    },
    '1bbj009t': {
      'en': 'Personalization',
      'fr': 'Personnalisation',
    },
    'pym4d8ws': {
      'en': 'Document Categories',
      'fr': 'Catégories de documents',
    },
    'gljwxayp': {
      'en':
          'You have access to the default categories and you can create unlimited custom categories',
      'fr':
          'Vous avez accès aux catégories par défaut et vous pouvez créer un nombre illimité de catégories personnalisées',
    },
    '7cg9f2xu': {
      'en': '∞ Custom',
      'fr': '∞ Personnalisé',
    },
    'yongpki4': {
      'en': 'Customization',
      'fr': 'Personnalisation',
    },
    'jiupgtt5': {
      'en': 'You can customize and organize your folder as desired',
      'fr':
          'Vous pouvez personnaliser et organiser votre dossier comme vous le souhaitez',
    },
    '63gpveu4': {
      'en': 'Widget',
      'fr': 'Widget',
    },
    'hdhbyr9w': {
      'en': 'You get Sleeq widget for your home screen',
      'fr': 'Vous obtenez le widget Sleeq pour votre écran d\'accueil',
    },
  },
  // PlanFamily
  {
    'bo4f0xl2': {
      'en': 'Sleeq Family',
      'fr': 'Famille Sleeq',
    },
    '5cp455ub': {
      'en': 'For 4 members of the family',
      'fr': 'Pour 4 membres de la famille',
    },
    'lj5paxa8': {
      'en': '19.99 € per month',
      'fr': '19,99 € par mois',
    },
    '1a9x2awl': {
      'en': 'Category',
      'fr': 'Catégorie',
    },
    '9zxh3k8s': {
      'en': 'Included documents',
      'fr': 'Documents inclus',
    },
    '8dpf80z4': {
      'en': 'Each member can store 75 documents',
      'fr': 'Chaque membre peut stocker 75 documents',
    },
    '56wdwv00': {
      'en': '75 x 4 ',
      'fr': '75 × 4',
    },
    '2bbuugnk': {
      'en': 'Max document size',
      'fr': 'Taille maximale du document',
    },
    'av9dkv0f': {
      'en': 'Your documents can weigh up to 5 MB each',
      'fr': 'Vos documents peuvent peser jusqu\'à 5 Mo chacun',
    },
    'jr29we1u': {
      'en': 'Access from',
      'fr': 'Accès depuis',
    },
    'powwvta6': {
      'en': 'Smartphone',
      'fr': 'Téléphone intelligent',
    },
    '4k3zq5gk': {
      'en': 'Access and upload you documents from a smartphone',
      'fr': 'Accéder et télécharger vos documents depuis un smartphone',
    },
    '5ugj395m': {
      'en': '5 MD',
      'fr': '5 MD',
    },
    'rv928oc3': {
      'en': 'Computer',
      'fr': 'Ordinateur',
    },
    'kexupvum': {
      'en': 'Access and upload you documents from a computer',
      'fr': 'Accéder et télécharger vos documents depuis un ordinateur',
    },
    'czfx1lv6': {
      'en': 'Import from',
      'fr': 'Importer de',
    },
    'qgb1hmcj': {
      'en': 'Folder',
      'fr': 'Dossier',
    },
    '56gywn16': {
      'en': 'Import documents from your folder',
      'fr': 'Importer des documents depuis votre dossier',
    },
    'jgd99lpe': {
      'en': 'Camera',
      'fr': 'Caméra',
    },
    'm323y3vi': {
      'en': 'Import documents using the camera',
      'fr': 'Importer des documents à l\'aide de l\'appareil photo',
    },
    'kjlr1k0c': {
      'en': 'Optical Character Recognition ',
      'fr': 'Reconnaissance optique de caractères',
    },
    'cbhqgow9': {
      'en': 'Apply optical character recognition on your documents ',
      'fr':
          'Appliquez la reconnaissance optique des caractères sur vos documents',
    },
    'jcvzav3q': {
      'en': 'Export to',
      'fr': 'Exporter vers',
    },
    'kdcja81a': {
      'en': 'Folder',
      'fr': 'Dossier',
    },
    'rbhvua7o': {
      'en': 'Import documents from your folder',
      'fr': 'Importer des documents depuis votre dossier',
    },
    'jw7rayt2': {
      'en': 'Email',
      'fr': 'E-mail',
    },
    'csbvace6': {
      'en': 'Export documents to your emails',
      'fr': 'Exportez des documents vers vos e-mails',
    },
    '53wn8d6j': {
      'en': 'Calender ',
      'fr': 'Calandre',
    },
    'f0w3tscc': {
      'en': 'Export your documents to your calender',
      'fr': 'Exportez vos documents vers votre calendrier',
    },
    'm5wqqpj8': {
      'en': 'Wallet',
      'fr': 'Portefeuille',
    },
    'cx25aiuy': {
      'en': 'Export your documents to your wallet',
      'fr': 'Exportez vos documents vers votre portefeuille',
    },
    '7d4qwul7': {
      'en': 'Personalization',
      'fr': 'Personnalisation',
    },
    '3pv97cg1': {
      'en': 'Document Categories',
      'fr': 'Catégories de documents',
    },
    'r6f36kww': {
      'en':
          'You have access to the default categories and you can create unlimited custom categories',
      'fr':
          'Vous avez accès aux catégories par défaut et vous pouvez créer un nombre illimité de catégories personnalisées',
    },
    'gg5wwb31': {
      'en': '∞ Custom',
      'fr': '∞ Personnalisé',
    },
    '0xjtg3gk': {
      'en': 'Customization',
      'fr': 'Personnalisation',
    },
    '1gu2ypr8': {
      'en': 'You can customize and organize your folder as desired',
      'fr':
          'Vous pouvez personnaliser et organiser votre dossier comme vous le souhaitez',
    },
    'gflz1pwh': {
      'en': 'Widget',
      'fr': 'Widget',
    },
    'c0tpfyn5': {
      'en': 'You get Sleeq widget for your home screen',
      'fr': 'Vous obtenez le widget Sleeq pour votre écran d\'accueil',
    },
  },
  // PlanPlus
  {
    '3bmwaqdo': {
      'en': 'Sleeq Plus',
      'fr': 'Sleeq Plus',
    },
    'un4s5v2h': {
      'en': 'For storage fans',
      'fr': 'Pour les ventilateurs de stockage',
    },
    'hwl466l9': {
      'en': '10.99 € per month',
      'fr': '10,99 € par mois',
    },
    'c7sw9r7d': {
      'en': 'Category',
      'fr': 'Catégorie',
    },
    'y1jfj8f2': {
      'en': 'Included documents',
      'fr': 'Documents inclus',
    },
    'xgbxty2i': {
      'en': 'You can store as many documents as desired',
      'fr': 'Vous pouvez stocker autant de documents que vous le souhaitez',
    },
    'xyhqlqp4': {
      'en': '∞',
      'fr': '∞',
    },
    'zojsbwug': {
      'en': 'Max document size',
      'fr': 'Taille maximale du document',
    },
    'fzp2waka': {
      'en': 'Your documents can weigh up to 50 MB each',
      'fr': 'Vos documents peuvent peser jusqu\'à 50 Mo chacun',
    },
    'u6enclmq': {
      'en': 'Access from',
      'fr': 'Accès depuis',
    },
    '5h3a9jj2': {
      'en': 'Smartphone',
      'fr': 'Téléphone intelligent',
    },
    'pevy9qwl': {
      'en': 'Access and upload you documents from a smartphone',
      'fr': 'Accéder et télécharger vos documents depuis un smartphone',
    },
    '6rgevgae': {
      'en': '5 MD',
      'fr': '5 MD',
    },
    'ndemd64w': {
      'en': 'Computer',
      'fr': 'Ordinateur',
    },
    '1bp1m3aj': {
      'en': 'Access and upload you documents from a computer',
      'fr': 'Accéder et télécharger vos documents depuis un ordinateur',
    },
    '5f4v1b7g': {
      'en': 'Import from',
      'fr': 'Importer de',
    },
    'x7mlky96': {
      'en': 'Folder',
      'fr': 'Dossier',
    },
    'o20ryzgf': {
      'en': 'Import documents from your folder',
      'fr': 'Importer des documents depuis votre dossier',
    },
    'qbords3x': {
      'en': 'Camera',
      'fr': 'Caméra',
    },
    '9ehfx6qs': {
      'en': 'Import documents using the camera',
      'fr': 'Importer des documents à l\'aide de l\'appareil photo',
    },
    '04j6sacv': {
      'en': 'Optical Character Recognition ',
      'fr': 'Reconnaissance optique de caractères',
    },
    '3yzb3g7m': {
      'en': 'Apply optical character recognition on your documents ',
      'fr':
          'Appliquez la reconnaissance optique des caractères sur vos documents',
    },
    'an9ij6vt': {
      'en': 'Export to',
      'fr': 'Exporter vers',
    },
    'zhfb9fuj': {
      'en': 'Folder',
      'fr': 'Dossier',
    },
    '7slc315w': {
      'en': 'Import documents from your folder',
      'fr': 'Importer des documents depuis votre dossier',
    },
    '7jds73k6': {
      'en': 'Email',
      'fr': 'E-mail',
    },
    'yjp7honc': {
      'en': 'Export documents to your emails',
      'fr': 'Exportez des documents vers vos e-mails',
    },
    '719sr3dv': {
      'en': 'Calender ',
      'fr': 'Calandre',
    },
    'rpog2rsf': {
      'en': 'Export your documents to your calender',
      'fr': 'Exportez vos documents vers votre calendrier',
    },
    'va46hbu0': {
      'en': 'Wallet',
      'fr': 'Portefeuille',
    },
    'px1f63ym': {
      'en': 'Export your documents to your wallet',
      'fr': 'Exportez vos documents vers votre portefeuille',
    },
    '23fdnpjv': {
      'en': 'Personalization',
      'fr': 'Personnalisation',
    },
    '5mo9tety': {
      'en': 'Document Categories',
      'fr': 'Catégories de documents',
    },
    'tkdvz9vq': {
      'en':
          'You have access to the default categories and you can create unlimited custom categories',
      'fr':
          'Vous avez accès aux catégories par défaut et vous pouvez créer un nombre illimité de catégories personnalisées',
    },
    'escze8pn': {
      'en': '∞ Custom',
      'fr': '∞ Personnalisé',
    },
    'rh95gb3q': {
      'en': 'Customization',
      'fr': 'Personnalisation',
    },
    'ospfoqvv': {
      'en': 'You can customize and organize your folder as desired',
      'fr':
          'Vous pouvez personnaliser et organiser votre dossier comme vous le souhaitez',
    },
    'brss592u': {
      'en': 'Widget',
      'fr': 'Widget',
    },
    '6bojlfsb': {
      'en': 'You get Sleeq widget for your home screen',
      'fr': 'Vous obtenez le widget Sleeq pour votre écran d\'accueil',
    },
  },
  // PlanArchive
  {
    're3qvhr4': {
      'en': 'Sleeq Archive',
      'fr': 'Archives Sleeq',
    },
    'r5g5f2lz': {
      'en': 'Decent storage for a small price',
      'fr': 'Stockage décent pour un petit prix',
    },
    '2b1lz4ye': {
      'en': '4.99 € per month',
      'fr': '4,99 € par mois',
    },
    'vj8fbnmz': {
      'en': 'Category',
      'fr': 'Catégorie',
    },
    'ug3oa3jk': {
      'en': 'Included documents',
      'fr': 'Documents inclus',
    },
    'drjdhz61': {
      'en': 'You can store up to 75 documents',
      'fr': 'Vous pouvez stocker jusqu\'à 75 documents',
    },
    'l44xqb9s': {
      'en': '75',
      'fr': '75',
    },
    '0zsr1nrw': {
      'en': 'Max document size',
      'fr': 'Taille maximale du document',
    },
    '5croalt7': {
      'en': 'Your documents can weigh up to 20 MB each',
      'fr': 'Vos documents peuvent peser jusqu\'à 20 Mo chacun',
    },
    'vgwduac3': {
      'en': 'Access from',
      'fr': 'Accès depuis',
    },
    'jbk7glc8': {
      'en': 'Smartphone',
      'fr': 'Téléphone intelligent',
    },
    'euze2v5a': {
      'en': 'Access and upload you documents from a smartphone',
      'fr': 'Accéder et télécharger vos documents depuis un smartphone',
    },
    'ks70ydqf': {
      'en': '5 MD',
      'fr': '5 MD',
    },
    '3azx0u2x': {
      'en': 'Computer',
      'fr': 'Ordinateur',
    },
    '0s0wclvb': {
      'en': 'Access and upload you documents from a computer',
      'fr': 'Accéder et télécharger vos documents depuis un ordinateur',
    },
    '92fnqc1f': {
      'en': 'Import from',
      'fr': 'Importer de',
    },
    'm3z6fclk': {
      'en': 'Folder',
      'fr': 'Dossier',
    },
    '2jnbi3st': {
      'en': 'Import documents from your folder',
      'fr': 'Importer des documents depuis votre dossier',
    },
    'ncmbarke': {
      'en': 'Camera',
      'fr': 'Caméra',
    },
    'p7a79qcz': {
      'en': 'Import documents using the camera',
      'fr': 'Importer des documents à l\'aide de l\'appareil photo',
    },
    'avnxvq63': {
      'en': 'Optical Character Recognition ',
      'fr': 'Reconnaissance optique de caractères',
    },
    'dv9f17rt': {
      'en': 'Apply optical character recognition on your documents ',
      'fr':
          'Appliquez la reconnaissance optique des caractères sur vos documents',
    },
    '5bk7nrji': {
      'en': 'Export to',
      'fr': 'Exporter vers',
    },
    'v4xbu2xt': {
      'en': 'Folder',
      'fr': 'Dossier',
    },
    'lvwe4utf': {
      'en': 'Import documents from your folder',
      'fr': 'Importer des documents depuis votre dossier',
    },
    'cuefj49n': {
      'en': 'Email',
      'fr': 'E-mail',
    },
    'wvpv9n67': {
      'en': 'Export documents to your emails',
      'fr': 'Exportez des documents vers vos e-mails',
    },
    '77qnp8cg': {
      'en': 'Calender ',
      'fr': 'Calandre',
    },
    'my5st8f4': {
      'en': 'Export your documents to your calender',
      'fr': 'Exportez vos documents vers votre calendrier',
    },
    'iqllvw56': {
      'en': 'Wallet',
      'fr': 'Portefeuille',
    },
    'kddue9ok': {
      'en': 'Export your documents to your wallet',
      'fr': 'Exportez vos documents vers votre portefeuille',
    },
    '43izaoi3': {
      'en': 'Personalization',
      'fr': 'Personnalisation',
    },
    '7b7e09j6': {
      'en': 'Document Categories',
      'fr': 'Catégories de documents',
    },
    '0c6q1mfe': {
      'en':
          'You have access to the default categories and you can create 5 custom categories',
      'fr':
          'Vous avez accès aux catégories par défaut et vous pouvez créer 5 catégories personnalisées',
    },
    'zg1fj66z': {
      'en': '5 Customs',
      'fr': '5 Douanes',
    },
    'xttatbp2': {
      'en': 'Customization',
      'fr': 'Personnalisation',
    },
    'yrhf8jfc': {
      'en': 'You can customize and organize your folder as desired',
      'fr':
          'Vous pouvez personnaliser et organiser votre dossier comme vous le souhaitez',
    },
    '6wzoo91e': {
      'en': 'Widget',
      'fr': 'Widget',
    },
    '11awx8jd': {
      'en': 'You get Sleeq widget for your home screen',
      'fr': 'Vous obtenez le widget Sleeq pour votre écran d\'accueil',
    },
  },
  // PlanStudent
  {
    'bb7id06n': {
      'en': 'Sleeq Student',
      'fr': 'Étudiant élégant',
    },
    'c31nowtx': {
      'en': 'Many features for a small price',
      'fr': 'De nombreuses fonctionnalités pour un petit prix',
    },
    '5tex9jfw': {
      'en': '14.99 € per month',
      'fr': '14,99 € par mois',
    },
    'mxwifify': {
      'en': 'Category',
      'fr': 'Catégorie',
    },
    'd9b1odoq': {
      'en': 'Included documents',
      'fr': 'Documents inclus',
    },
    '7vil3t1d': {
      'en': 'You can store up to 100 documents',
      'fr': 'Vous pouvez stocker jusqu\'à 100 documents',
    },
    'yqf4zs3l': {
      'en': '100',
      'fr': '100',
    },
    'k9lumfq7': {
      'en': 'Max document size',
      'fr': 'Taille maximale du document',
    },
    '0anlw2m2': {
      'en': 'Your documents can weigh up to 5 MB each',
      'fr': 'Vos documents peuvent peser jusqu\'à 5 Mo chacun',
    },
    '7yt49vaz': {
      'en': 'Access from',
      'fr': 'Accès depuis',
    },
    '4wkelm0f': {
      'en': 'Smartphone',
      'fr': 'Téléphone intelligent',
    },
    'pbeh9iii': {
      'en': 'Access and upload you documents from a smartphone',
      'fr': 'Accéder et télécharger vos documents depuis un smartphone',
    },
    'ebv8n144': {
      'en': '5 MD',
      'fr': '5 MD',
    },
    '6cgo24rs': {
      'en': 'Computer',
      'fr': 'Ordinateur',
    },
    '7sovou5s': {
      'en': 'Access and upload you documents from a computer',
      'fr': 'Accéder et télécharger vos documents depuis un ordinateur',
    },
    'k5ag7fe4': {
      'en': 'Import from',
      'fr': 'Importer de',
    },
    'rllvs78e': {
      'en': 'Folder',
      'fr': 'Dossier',
    },
    '1m2xj6oh': {
      'en': 'Import documents from your folder',
      'fr': 'Importer des documents depuis votre dossier',
    },
    '1gglv62l': {
      'en': 'Camera',
      'fr': 'Caméra',
    },
    'vtx2ue6m': {
      'en': 'Import documents using the camera',
      'fr': 'Importer des documents à l\'aide de l\'appareil photo',
    },
    'kf8jmc47': {
      'en': 'Optical Character Recognition ',
      'fr': 'Reconnaissance optique de caractères',
    },
    's4wqv3pq': {
      'en': 'Apply optical character recognition on your documents ',
      'fr':
          'Appliquez la reconnaissance optique des caractères sur vos documents',
    },
    '5uaipt2p': {
      'en': 'Export to',
      'fr': 'Exporter vers',
    },
    '74uaefdp': {
      'en': 'Folder',
      'fr': 'Dossier',
    },
    'fceqwbsp': {
      'en': 'Import documents from your folder',
      'fr': 'Importer des documents depuis votre dossier',
    },
    '3fxzcrbv': {
      'en': 'Email',
      'fr': 'E-mail',
    },
    '56rz3w7u': {
      'en': 'Export documents to your emails',
      'fr': 'Exportez des documents vers vos e-mails',
    },
    'ts1o86nv': {
      'en': 'Calender ',
      'fr': 'Calandre',
    },
    '97wruv5e': {
      'en': 'Export your documents to your calender',
      'fr': 'Exportez vos documents vers votre calendrier',
    },
    '8uhhwx1v': {
      'en': 'Wallet',
      'fr': 'Portefeuille',
    },
    '5gep6hdl': {
      'en': 'Export your documents to your wallet',
      'fr': 'Exportez vos documents vers votre portefeuille',
    },
    'myngt3bx': {
      'en': 'Personalization',
      'fr': 'Personnalisation',
    },
    'ojswo6eu': {
      'en': 'Document Categories',
      'fr': 'Catégories de documents',
    },
    '6t59bewu': {
      'en':
          'You have access to the default categories and you can create 5 custom categories',
      'fr':
          'Vous avez accès aux catégories par défaut et vous pouvez créer 5 catégories personnalisées',
    },
    'g1li076p': {
      'en': '5 Customs',
      'fr': '5 Douanes',
    },
    'ifwb6dya': {
      'en': 'Customization',
      'fr': 'Personnalisation',
    },
    'v1c2kqpt': {
      'en': 'You can customize and organize your folder as desired',
      'fr':
          'Vous pouvez personnaliser et organiser votre dossier comme vous le souhaitez',
    },
    'kyu1zfnx': {
      'en': 'Widget',
      'fr': 'Widget',
    },
    'etldstjk': {
      'en': 'You get Sleeq widget for your home screen',
      'fr': 'Vous obtenez le widget Sleeq pour votre écran d\'accueil',
    },
  },
  // newButton
  {
    'x90ppz22': {
      'en': 'New',
      'fr': 'Nouveau',
    },
  },
  // MovePopup
  {
    'ch8g34ya': {
      'en': 'Move selected elements',
      'fr': 'Déplacer les éléments sélectionnés',
    },
  },
  // CopyPastePopup
  {
    '3pr1p7mm': {
      'en': 'Paste selected elements',
      'fr': 'Coller les éléments sélectionnés',
    },
  },
  // VCard
  {
    'aurrqa4i': {
      'en': 'CARTE NATIONALE D\'ITENTITE',
      'fr': '',
    },
    'b5p53jgm': {
      'en': 'Nom:',
      'fr': '',
    },
    'qcske1cg': {
      'en': 'BENARROCHE',
      'fr': '',
    },
    'zua7f72u': {
      'en': 'Prénoms:',
      'fr': '',
    },
    '8zgt49n4': {
      'en': 'Ilan Isaac',
      'fr': '',
    },
    'wbtj1a32': {
      'en': 'Sexe:',
      'fr': '',
    },
    '7uyeo2lq': {
      'en': 'H',
      'fr': '',
    },
    '66hqryi0': {
      'en': 'Nationalité:',
      'fr': '',
    },
    'bfoqz6pd': {
      'en': 'FRA',
      'fr': '',
    },
    '6xr4eiib': {
      'en': 'Date de naiss:',
      'fr': '',
    },
    '09k0w4r6': {
      'en': '30 07 1999',
      'fr': '',
    },
    '6p8wchph': {
      'en': 'N°',
      'fr': '',
    },
    'vbi1cjma': {
      'en': '180695358957',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    'vqnpk0nj': {
      'en': 'Label here...',
      'fr': 'Étiquette ici...',
    },
    '3zaznyvo': {
      'en': 'Hello World',
      'fr': '',
    },
    '7sgbm13u': {
      'en':
          'In order to take a picture or video, this app requires permission to access the camera.',
      'fr':
          'Afin de prendre une photo ou une vidéo, cette application nécessite une autorisation pour accéder à la caméra.',
    },
    'ryi4f0pr': {
      'en':
          'In order to upload data, this app requires permission to access the photo library.',
      'fr':
          'Afin de télécharger des données, cette application nécessite l\'autorisation d\'accéder à la photothèque.',
    },
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
    'omyapxge': {
      'en': '',
      'fr': '',
    },
    'ctxqg4vi': {
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
    'v8sb7u0m': {
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
