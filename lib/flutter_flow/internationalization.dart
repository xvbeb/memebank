import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'uk'];

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
    String? ukText = '',
  }) =>
      [enText, ukText][languageIndex] ?? '';

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
  // loginPage
  {
    '3yjgpbuf': {
      'en': 'Welcome back',
      'uk': '',
    },
    'k2wbejol': {
      'en': 'Login to access your account below.',
      'uk': '',
    },
    'esckn1p7': {
      'en': 'Email Address',
      'uk': '',
    },
    'v7f9itkh': {
      'en': 'Enter your email...',
      'uk': '',
    },
    '7tgmvl90': {
      'en': 'Password',
      'uk': '',
    },
    'jxe5d338': {
      'en': 'Enter your password...',
      'uk': '',
    },
    'v4azrnjr': {
      'en': 'Forgot Password?',
      'uk': '',
    },
    'chs2yyit': {
      'en': 'Login',
      'uk': '',
    },
    'rhhuezf4': {
      'en': 'Don\'t have an account?',
      'uk': '',
    },
    'i9ph2fu5': {
      'en': 'Create',
      'uk': '',
    },
    '6kl2fqjn': {
      'en': 'Continue as Guest',
      'uk': '',
    },
    'rg4nb28u': {
      'en': 'Home',
      'uk': '',
    },
  },
  // registerAccount
  {
    'r4ywnwnz': {
      'en': 'Get Started',
      'uk': '',
    },
    'o6jn5ikj': {
      'en': 'Create your account below.',
      'uk': '',
    },
    'utx215i4': {
      'en': 'Email Address',
      'uk': '',
    },
    '16ij6mn3': {
      'en': 'Enter your email...',
      'uk': '',
    },
    's8sdv1c7': {
      'en': 'Password',
      'uk': '',
    },
    '1z5r35zi': {
      'en': 'Enter your password...',
      'uk': '',
    },
    'tzbj2lyt': {
      'en': 'Confirm Password',
      'uk': '',
    },
    'z6ckzwgl': {
      'en': 'Enter your password...',
      'uk': '',
    },
    'nj90705u': {
      'en': 'Create Account',
      'uk': '',
    },
    'ua9cbly4': {
      'en': 'Login',
      'uk': '',
    },
    'q01xuzfr': {
      'en': 'Already have an account?',
      'uk': '',
    },
    '1mmujtg0': {
      'en': 'Continue as Guest',
      'uk': '',
    },
    'jw5yr322': {
      'en': 'Home',
      'uk': '',
    },
  },
  // completeProfile
  {
    '74zqcqz3': {
      'en': 'Complete Profile',
      'uk': '',
    },
    '4y3i9e1j': {
      'en': 'Upload a photo for us to easily identify you.',
      'uk': '',
    },
    '5a23k9dg': {
      'en': 'Your Name',
      'uk': '',
    },
    'aaopxg3r': {
      'en': 'Your Age',
      'uk': '',
    },
    '6kbntlk5': {
      'en': 'i.e. 34',
      'uk': '',
    },
    'h5cp8pn3': {
      'en': 'Your Title',
      'uk': '',
    },
    '3a7m0yyu': {
      'en': 'What is your position?',
      'uk': '',
    },
    'f8w3wld1': {
      'en': 'Complete Profile',
      'uk': '',
    },
    '3t9tkynz': {
      'en': 'Skip for Now',
      'uk': '',
    },
    'n9hd2vv6': {
      'en': 'Field is required',
      'uk': '',
    },
    'gr7wsh0p': {
      'en': 'Field is required',
      'uk': '',
    },
    '50uyukri': {
      'en': 'Field is required',
      'uk': '',
    },
    '0zx9hkmn': {
      'en': 'Home',
      'uk': '',
    },
  },
  // forgotPassword
  {
    'ywfdecsr': {
      'en': 'Forgot Password',
      'uk': '',
    },
    'srtj0tkt': {
      'en':
          'Enter the email associated with your account and we will send you a verification code.',
      'uk': '',
    },
    'ytm1px4g': {
      'en': 'Email Address',
      'uk': '',
    },
    'c9k7vdkt': {
      'en': 'Enter your email...',
      'uk': '',
    },
    '72e0knqm': {
      'en': 'Send Reset Link',
      'uk': '',
    },
    '0wf4wxs8': {
      'en': 'Home',
      'uk': '',
    },
  },
  // onboarding
  {
    'lx65a9jo': {
      'en': 'Create Budgets',
      'uk': '',
    },
    'f6fjuva2': {
      'en':
          'Create budgets that you can tie transactions too in order for easy tracking.',
      'uk': '',
    },
    'ge3qopiu': {
      'en': 'Keep Track of Spending',
      'uk': '',
    },
    'j55sltzs': {
      'en':
          'Easily add transactions and associate them with budgets that have been created.',
      'uk': '',
    },
    'ithc7qeq': {
      'en': 'Budget Analysis',
      'uk': '',
    },
    '4qd5s0ds': {
      'en': 'Know where your budgets are and how they can be adjusted.',
      'uk': '',
    },
    'odztwoeb': {
      'en': 'Create Your Budget',
      'uk': '',
    },
    'znhte03v': {
      'en': 'Home',
      'uk': '',
    },
  },
  // createBudgetBegin
  {
    'vn9nesep': {
      'en': 'Create Budget',
      'uk': '',
    },
    'mb963qk9': {
      'en': 'Amount',
      'uk': '',
    },
    '8jshezzz': {
      'en': 'Budget Name',
      'uk': '',
    },
    'hmtvuhrs': {
      'en': 'Description',
      'uk': '',
    },
    'h0q9uair': {
      'en': 'Create Budget',
      'uk': '',
    },
    'cp7fewo2': {
      'en': 'Tap above to complete request',
      'uk': '',
    },
    'afvob7y1': {
      'en': 'Please enter an amount',
      'uk': '',
    },
    'gbpf6kak': {
      'en': 'Home',
      'uk': '',
    },
  },
  // MY_Card
  {
    'j5s2z64w': {
      'en': 'My Card',
      'uk': '',
    },
    '4hfkyxjj': {
      'en': 'Balance',
      'uk': '',
    },
    'c75tlbf1': {
      'en': '\$7,630',
      'uk': '',
    },
    'vt5heta7': {
      'en': '**** 0149',
      'uk': '',
    },
    '8phmkdq2': {
      'en': '05/25',
      'uk': '',
    },
    'jpu7uw26': {
      'en': 'Income',
      'uk': '',
    },
    'ldrdu0nx': {
      'en': '+\$12,402',
      'uk': '',
    },
    '2w40j6ft': {
      'en': '4.5% ',
      'uk': '',
    },
    'jwvcvc0s': {
      'en': 'Spending',
      'uk': '',
    },
    'lo18vrri': {
      'en': '-\$8,392',
      'uk': '',
    },
    'r36b0w4x': {
      'en': '4.5% ',
      'uk': '',
    },
    'ai4ud4a8': {
      'en': 'Quick Service',
      'uk': '',
    },
    'jvg8u9yr': {
      'en': 'Transfer',
      'uk': '',
    },
    '2cjpkvoo': {
      'en': 'Pause Card',
      'uk': '',
    },
    'a0xf5mfd': {
      'en': 'Transaction',
      'uk': '',
    },
    'qhlnj1pl': {
      'en': 'Income',
      'uk': '',
    },
    'cpkcy6tp': {
      'en': '•',
      'uk': '',
    },
  },
  // MY_Budgets
  {
    'abryq91q': {
      'en': 'My Budget',
      'uk': '',
    },
    'ipb3bngc': {
      'en': 'Income',
      'uk': '',
    },
    'spffo6e6': {
      'en': '+\$12,402',
      'uk': '',
    },
    'm7pwhaej': {
      'en': '4.5% ',
      'uk': '',
    },
    'q3vu6emr': {
      'en': 'Spending',
      'uk': '',
    },
    'iso11hbc': {
      'en': '-\$8,392',
      'uk': '',
    },
    'damdodgq': {
      'en': '4.5% ',
      'uk': '',
    },
    'mqwzwq9u': {
      'en': 'Total Spent',
      'uk': '',
    },
    'p453fri6': {
      'en': 'Advertising Budget',
      'uk': '',
    },
    'yhm9g6e4': {
      'en': '\$3,000',
      'uk': '',
    },
    'mzgotiwd': {
      'en': '4 Days Left',
      'uk': '',
    },
    'ims7bvmw': {
      'en': 'Total Spent',
      'uk': '',
    },
    '04c4bqp1': {
      'en': '\$2,502',
      'uk': '',
    },
    'nmsiv20i': {
      'en': 'Advertising Budget',
      'uk': '',
    },
    '0ieb7lon': {
      'en': '\$3,000',
      'uk': '',
    },
    'tj0fq4ef': {
      'en': '4 Days Left',
      'uk': '',
    },
    'r0fbwzge': {
      'en': 'Total Spent',
      'uk': '',
    },
    'jts2610w': {
      'en': '\$2,502',
      'uk': '',
    },
    'zftjnexs': {
      'en': '•',
      'uk': '',
    },
  },
  // paymentDetails
  {
    'fmkvkh7w': {
      'en': 'Details',
      'uk': '',
    },
    'o8g9skul': {
      'en': 'Amount',
      'uk': '',
    },
    '2c2n1lp8': {
      'en': 'Vendor',
      'uk': '',
    },
    '6elzs3we': {
      'en': 'When',
      'uk': '',
    },
    't9m8bx9w': {
      'en': 'Reason',
      'uk': '',
    },
    '2bjqq9ov': {
      'en': 'Spent by',
      'uk': '',
    },
    'c9d6dpka': {
      'en': 'Home',
      'uk': '',
    },
  },
  // MY_profilePage
  {
    '2hj4p9xp': {
      'en': 'My Account',
      'uk': '',
    },
    'c6pd4edw': {
      'en': 'Edit Profile',
      'uk': '',
    },
    'yrni463e': {
      'en': 'Change Password',
      'uk': '',
    },
    '5l02qb19': {
      'en': 'Notification Settings',
      'uk': '',
    },
    'wwk4jwx6': {
      'en': 'Tutorial',
      'uk': '',
    },
    '7qdmcvmj': {
      'en': 'Privacy Policy',
      'uk': '',
    },
    'rksgy0av': {
      'en': 'Dark Mode',
      'uk': '',
    },
    'penk3yv1': {
      'en': 'Light Mode',
      'uk': '',
    },
    'lp2oukq8': {
      'en': '•',
      'uk': '',
    },
  },
  // budgetDetails
  {
    '1cpdbzfe': {
      'en': 'Per Month',
      'uk': '',
    },
    'zsagydtl': {
      'en': 'Total Spent',
      'uk': '',
    },
    'voff1zhu': {
      'en': 'Transactions',
      'uk': '',
    },
    'jmxe8hyx': {
      'en': 'Income',
      'uk': '',
    },
    'a8g0poq9': {
      'en': 'Home',
      'uk': '',
    },
  },
  // transferComplete
  {
    't4zqn44i': {
      'en': 'Transfer Complete',
      'uk': '',
    },
    'tbxj23ka': {
      'en':
          'Great work, you successfully transferred funds. It may take a few days for the funds to leave your account.',
      'uk': '',
    },
    '484swk0d': {
      'en': 'Okay',
      'uk': '',
    },
    'itr2f12j': {
      'en': 'Home',
      'uk': '',
    },
  },
  // transferFunds
  {
    'lqjdokdr': {
      'en': 'Transfer Funds',
      'uk': '',
    },
    '84yw2h73': {
      'en': 'Balance',
      'uk': '',
    },
    '2nn0g5vg': {
      'en': '\$7,630',
      'uk': '',
    },
    'mamts266': {
      'en': '**** 0149',
      'uk': '',
    },
    'ce7pmsn1': {
      'en': '05/25',
      'uk': '',
    },
    '01wk6an3': {
      'en': 'Change Account',
      'uk': '',
    },
    'mht2o1um': {
      'en': 'Internal Transfer',
      'uk': '',
    },
    'mwxy5z4g': {
      'en': 'External Transfer',
      'uk': '',
    },
    'u8h5fp8d': {
      'en': 'ACH Payment',
      'uk': '',
    },
    'rprrhmi9': {
      'en': 'Transfer Type',
      'uk': '',
    },
    '99ez60ng': {
      'en': 'Select Account',
      'uk': '',
    },
    '7j6oxl8b': {
      'en': 'Account ****2010',
      'uk': '',
    },
    'x7kufofr': {
      'en': 'Account ****2011',
      'uk': '',
    },
    'nw6fpj2e': {
      'en': 'Account ****2012',
      'uk': '',
    },
    '5av3yawo': {
      'en': 'Choose an Account',
      'uk': '',
    },
    '29fr3oi1': {
      'en': '\$ Amount',
      'uk': '',
    },
    'ovmwigcf': {
      'en': 'Your new account balance is:',
      'uk': '',
    },
    'xypunxfi': {
      'en': '\$7,630',
      'uk': '',
    },
    'mbkdia8x': {
      'en': 'Send Transfer',
      'uk': '',
    },
    'tuyp9r2e': {
      'en': 'Tap above to complete transfer',
      'uk': '',
    },
    'm70my1me': {
      'en': 'Home',
      'uk': '',
    },
  },
  // requestFunds
  {
    'tk093p09': {
      'en': 'Request Funds',
      'uk': '',
    },
    '9iuap56d': {
      'en': '\$ Amount',
      'uk': '',
    },
    '4igjmj9a': {
      'en': 'Office Budget',
      'uk': '',
    },
    'symhbz9g': {
      'en': 'External Transfer',
      'uk': '',
    },
    'xk3mjtjc': {
      'en': 'ACH Payment',
      'uk': '',
    },
    '7nrjaaw5': {
      'en': 'Select Transfer',
      'uk': '',
    },
    'ca0ppmj8': {
      'en': 'Reason',
      'uk': '',
    },
    '9em1bnck': {
      'en': 'Request Funds',
      'uk': '',
    },
    '8f16pbwi': {
      'en': 'Tap above to complete request',
      'uk': '',
    },
    'gwh76ud2': {
      'en': 'Home',
      'uk': '',
    },
  },
  // createBudget
  {
    'soyaqsrg': {
      'en': 'Create Budget',
      'uk': '',
    },
    'tmasclhw': {
      'en': 'Amount',
      'uk': '',
    },
    'r25syw5y': {
      'en': 'Budget Name',
      'uk': '',
    },
    'v2z5itre': {
      'en': 'Description',
      'uk': '',
    },
    'pnkky0f2': {
      'en': 'Create Budget',
      'uk': '',
    },
    'cdr5igw9': {
      'en': 'Tap above to complete request',
      'uk': '',
    },
    'pkgmkuhm': {
      'en': 'Please enter an amount',
      'uk': '',
    },
    'bbzvv88d': {
      'en': 'Home',
      'uk': '',
    },
  },
  // transaction_ADD
  {
    '91ryi0vn': {
      'en': 'Add Transaction',
      'uk': '',
    },
    'ntotnifo': {
      'en': 'Amount',
      'uk': '',
    },
    'f0azbxpa': {
      'en': 'Spent At',
      'uk': '',
    },
    'k6g4lsyk': {
      'en': 'Office Budget',
      'uk': '',
    },
    'aqwewxd0': {
      'en': 'External Transfer',
      'uk': '',
    },
    'cies0evt': {
      'en': 'ACH Payment',
      'uk': '',
    },
    '82ibj1f7': {
      'en': 'Select Budget',
      'uk': '',
    },
    'p0fa5gz9': {
      'en': 'Reason',
      'uk': '',
    },
    'lb2cdqhe': {
      'en': 'Add Transaction',
      'uk': '',
    },
    'z0jfuzwa': {
      'en': 'Tap above to complete request',
      'uk': '',
    },
    '6cx846eg': {
      'en': 'Please enter an amount',
      'uk': '',
    },
    'zqgb6j6e': {
      'en': 'Home',
      'uk': '',
    },
  },
  // transaction_EDIT
  {
    'wag982ae': {
      'en': 'Edit Transaction',
      'uk': '',
    },
    '2uxunmzp': {
      'en': 'Amount',
      'uk': '',
    },
    '4whc1wwe': {
      'en': 'Spent At',
      'uk': '',
    },
    'bo93u0b2': {
      'en': 'Office Budget',
      'uk': '',
    },
    'vapyj9m9': {
      'en': 'External Transfer',
      'uk': '',
    },
    'uvkmlilt': {
      'en': 'ACH Payment',
      'uk': '',
    },
    'lcs9xm5m': {
      'en': 'Select Budget',
      'uk': '',
    },
    'b1k43jxr': {
      'en': 'Reason',
      'uk': '',
    },
    'uehdx7b1': {
      'en': 'Update Transaction',
      'uk': '',
    },
    '8zh6all5': {
      'en': 'Tap above to save your changes.',
      'uk': '',
    },
    'rmajsi7c': {
      'en': 'Please enter an amount',
      'uk': '',
    },
    '9g5exz2g': {
      'en': 'Home',
      'uk': '',
    },
  },
  // editProfile
  {
    'ik5f302x': {
      'en': 'Edit Profile',
      'uk': '',
    },
    'x0o6f0gw': {
      'en': 'Change Photo',
      'uk': '',
    },
    'ffym5bxc': {
      'en': 'Your Name',
      'uk': '',
    },
    '9xq9aspx': {
      'en': 'Please enter a valid number...',
      'uk': '',
    },
    '0czsz1xv': {
      'en': 'Email Address',
      'uk': '',
    },
    '8twzxs36': {
      'en': 'Your email',
      'uk': '',
    },
    'a3vph38l': {
      'en': 'Your Age',
      'uk': '',
    },
    'fj7xxhcj': {
      'en': 'i.e. 34',
      'uk': '',
    },
    'cr3w7cwk': {
      'en': 'Your Title',
      'uk': '',
    },
    'av6q0f9d': {
      'en': 'Save Changes',
      'uk': '',
    },
    '6je6a84u': {
      'en': 'Home',
      'uk': '',
    },
  },
  // changePassword
  {
    '60jrlufq': {
      'en': 'Change Password',
      'uk': '',
    },
    'bs8egbjm': {
      'en':
          'Enter the email associated with your account and we will send you link to reset your password.',
      'uk': '',
    },
    'd1jm5s7f': {
      'en': 'Email Address',
      'uk': '',
    },
    'hvb6df6f': {
      'en': 'Enter your email...',
      'uk': '',
    },
    'dpeneny4': {
      'en': 'Send Reset Link',
      'uk': '',
    },
    'kml9pte1': {
      'en': 'Home',
      'uk': '',
    },
  },
  // notificationsSettings
  {
    'vcu83st7': {
      'en': 'Notifications',
      'uk': '',
    },
    'l6lb821a': {
      'en':
          'Choose what notifcations you want to recieve below and we will update the settings.',
      'uk': '',
    },
    '2mk0xxox': {
      'en': 'Push Notifications',
      'uk': '',
    },
    '85vh7bs7': {
      'en':
          'Receive Push notifications from our application on a semi regular basis.',
      'uk': '',
    },
    '1g4hcgb9': {
      'en': 'Email Notifications',
      'uk': '',
    },
    's0lkhpwk': {
      'en':
          'Receive email notifications from our marketing team about new features.',
      'uk': '',
    },
    '3nma44k6': {
      'en': 'Location Services',
      'uk': '',
    },
    'jt45maex': {
      'en':
          'Allow us to track your location, this helps keep track of spending and keeps you safe.',
      'uk': '',
    },
    'e4lb8z03': {
      'en': 'Save Changes',
      'uk': '',
    },
    'yfyn8ufq': {
      'en': 'Home',
      'uk': '',
    },
  },
  // privacyPolicy
  {
    'wb894mxj': {
      'en': 'Privacy Policy',
      'uk': '',
    },
    'izdh69im': {
      'en': 'How we use your data',
      'uk': '',
    },
    'yg7989lv': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.\n\nEuismod lacinia at quis risus sed vulputate odio. Velit dignissim sodales ut eu sem integer vitae justo eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem integer vitae justo eget magna fermentum iaculis eu. Lacinia at quis risus sed. Faucibus purus in massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in est ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit.\n\nEt malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hac habitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Commodo sed egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
      'uk': '',
    },
    'zon0tf77': {
      'en': 'Home',
      'uk': '',
    },
  },
  // tutorial_PROFILE
  {
    'j97tfmm0': {
      'en': 'Tutorial',
      'uk': '',
    },
    '2zoql3si': {
      'en': 'Create Budgets',
      'uk': '',
    },
    'g4j1w1wc': {
      'en':
          'Create budgets that you can tie transactions too in order for easy tracking.',
      'uk': '',
    },
    '5lzsq64g': {
      'en': 'Keep Track of Spending',
      'uk': '',
    },
    'zrogjbjm': {
      'en':
          'Easily add transactions and associate them with budgets that have been created.',
      'uk': '',
    },
    'q2dkw88e': {
      'en': 'Budget Analysis',
      'uk': '',
    },
    'szkrm2zj': {
      'en': 'Know where your budgets are and how they can be adjusted.',
      'uk': '',
    },
    'v8ase2es': {
      'en': 'Home',
      'uk': '',
    },
  },
  // homePage
  {
    'whrmfy88': {
      'en': 'Welcome,',
      'uk': '',
    },
    'notm6hjn': {
      'en': 'Your account Details are below.',
      'uk': '',
    },
    'qwnfdisl': {
      'en': 'Total Balance',
      'uk': '',
    },
    '05j8hxxd': {
      'en': '\$25,202',
      'uk': '',
    },
    'wcra5w25': {
      'en': 'Payroll Due',
      'uk': '',
    },
    '9iiitmtd': {
      'en': '\$12,245',
      'uk': '',
    },
    'evx682z2': {
      'en': 'Debit Date',
      'uk': '',
    },
    '4l0d7u8b': {
      'en': 'Aug 31, 2021',
      'uk': '',
    },
    '2a40k8ar': {
      'en': '4 Days Left',
      'uk': '',
    },
    'ot6y4vhx': {
      'en': 'Marketing Budget',
      'uk': '',
    },
    'dd4rpwi2': {
      'en': '\$4,000',
      'uk': '',
    },
    'krgleoel': {
      'en': 'Total Spent',
      'uk': '',
    },
    'kdsjme1b': {
      'en': '\$3,402',
      'uk': '',
    },
    't8b0xzim': {
      'en': '4 Days Left',
      'uk': '',
    },
    'jvja8qh6': {
      'en': 'Quick Services',
      'uk': '',
    },
    'iuhou1xm': {
      'en': 'My Bank',
      'uk': '',
    },
    'zqlbagk4': {
      'en': 'Transfer',
      'uk': '',
    },
    'bgspdz40': {
      'en': 'Activity',
      'uk': '',
    },
    'yc3o2wgc': {
      'en': '1 New Alert',
      'uk': '',
    },
    'wdjwddkp': {
      'en': 'View Now',
      'uk': '',
    },
    'rris1i1l': {
      'en':
          'We noticed a small charge that is out of character of this account, please review.',
      'uk': '',
    },
    '2gnrn6cl': {
      'en': 'Home',
      'uk': '',
    },
  },
  // homePage_alt
  {
    'wwbprc4z': {
      'en': 'Welcome,',
      'uk': '',
    },
    'nvmnuib5': {
      'en': 'Andrew',
      'uk': '',
    },
    'bmvncpnq': {
      'en': 'Your latest updates are below.',
      'uk': '',
    },
    'rngtbyxl': {
      'en': 'Total Balance',
      'uk': '',
    },
    'aa9enct9': {
      'en': '\$25,281',
      'uk': '',
    },
    'jaagkogh': {
      'en': 'Total Balance',
      'uk': '',
    },
    'oskgiaxh': {
      'en': '\$25,281',
      'uk': '',
    },
    '0480gzyv': {
      'en': 'Total Balance',
      'uk': '',
    },
    '95jvntc7': {
      'en': '\$25,281',
      'uk': '',
    },
    'xlpppa1a': {
      'en': 'Next Payroll',
      'uk': '',
    },
    'jegd9i2b': {
      'en': '\$25,281',
      'uk': '',
    },
    '97w9fpq1': {
      'en': 'Debit Date',
      'uk': '',
    },
    'mhr8pb77': {
      'en': 'Aug 31, 2021',
      'uk': '',
    },
    '2kvmoklg': {
      'en': '4 days left',
      'uk': '',
    },
    'l901w6dg': {
      'en': '1 New Alert',
      'uk': '',
    },
    'dhuta5fe': {
      'en': 'Fraud Alert',
      'uk': '',
    },
    'hat3pe7m': {
      'en':
          'We noticed a small charge that is out of character of this account, please review.',
      'uk': '',
    },
    'uhzo67yl': {
      'en': 'View Now',
      'uk': '',
    },
    'gr35uuxy': {
      'en': 'Marketing Budget',
      'uk': '',
    },
    'f11hy5mk': {
      'en': '\$3,000',
      'uk': '',
    },
    'yrfhquhk': {
      'en': 'Total Spent',
      'uk': '',
    },
    '0egmamg1': {
      'en': '\$2,502',
      'uk': '',
    },
    'uq114ig8': {
      'en': '4 days left',
      'uk': '',
    },
    '0gd9mufb': {
      'en': 'Team Name',
      'uk': '',
    },
    '6ccjnsxf': {
      'en': '\$5,000',
      'uk': '',
    },
    'zqdt5jis': {
      'en': 'Head of Design',
      'uk': '',
    },
    '6kaz1rn4': {
      'en': '[Time Stamp]',
      'uk': '',
    },
    'vlul6hfh': {
      'en': '•',
      'uk': '',
    },
  },
  // homePage_alt_1
  {
    '10qv5m2e': {
      'en': 'Welcome,',
      'uk': '',
    },
    'qo0d59v1': {
      'en': 'Andrew',
      'uk': '',
    },
    'i10mxxms': {
      'en': 'Your latest updates are below.',
      'uk': '',
    },
    'gj97hwb7': {
      'en': 'Balance',
      'uk': '',
    },
    '83lydznq': {
      'en': '\$7,630',
      'uk': '',
    },
    'yk9izx2z': {
      'en': '**** 0149',
      'uk': '',
    },
    'id2trtsd': {
      'en': '05/25',
      'uk': '',
    },
    'pfbk368j': {
      'en': 'Quick Service',
      'uk': '',
    },
    'u2bpl0zm': {
      'en': 'Transfer',
      'uk': '',
    },
    'enkg99ef': {
      'en': 'Activity',
      'uk': '',
    },
    'kpl2bjns': {
      'en': 'My Bank',
      'uk': '',
    },
    '2puvdwaq': {
      'en': 'Transaction',
      'uk': '',
    },
    'k8eobbi7': {
      'en': 'Go Far Rewards',
      'uk': '',
    },
    'rpo0tcuq': {
      'en': 'Income',
      'uk': '',
    },
    'hkt3mdu3': {
      'en': '\$50.00',
      'uk': '',
    },
    'j822npmw': {
      'en': 'Hello World',
      'uk': '',
    },
    '67mu6j14': {
      'en': 'Go Far Rewards',
      'uk': '',
    },
    'kj40xxmy': {
      'en': 'Income',
      'uk': '',
    },
    'mdmrmm0h': {
      'en': '\$50.00',
      'uk': '',
    },
    'vh8ewgg6': {
      'en': 'Hello World',
      'uk': '',
    },
    'tkik1tej': {
      'en': 'Go Far Rewards',
      'uk': '',
    },
    'hyvqvt0d': {
      'en': 'Income',
      'uk': '',
    },
    'z4ifhjo1': {
      'en': '\$50.00',
      'uk': '',
    },
    'sdq0hhmj': {
      'en': 'Hello World',
      'uk': '',
    },
    'rchepj0c': {
      'en': 'Go Far Rewards',
      'uk': '',
    },
    '9rq12znz': {
      'en': 'Income',
      'uk': '',
    },
    'isouvjsm': {
      'en': '\$50.00',
      'uk': '',
    },
    'zllzct02': {
      'en': 'Hello World',
      'uk': '',
    },
    'ivyl5tbz': {
      'en': 'Home',
      'uk': '',
    },
  },
  // budget_DELETE
  {
    '96kp94v9': {
      'en': 'Delete Budget',
      'uk': '',
    },
    '2nxw5kib': {
      'en':
          'If you delete this budget, your transactions will no longer be associated with it.',
      'uk': '',
    },
    '22vqu3z7': {
      'en': 'Delete Budget',
      'uk': '',
    },
    '3cb24y71': {
      'en': 'Tap above to remove this bude',
      'uk': '',
    },
    '4yd1a2qy': {
      'en': 'Home',
      'uk': '',
    },
  },
  // profilepage
  {
    '0l9xoc2s': {
      'en': 'Wallet Balance',
      'uk': '',
    },
    'ybxicrlb': {
      'en': '\$23,000',
      'uk': '',
    },
    'hgligzsl': {
      'en': '3 currencies',
      'uk': '',
    },
    'fxoy3g33': {
      'en': 'My Bank',
      'uk': '',
    },
    'xh1npwsq': {
      'en': 'Transfer',
      'uk': '',
    },
    'gb35xa45': {
      'en': 'Activity',
      'uk': '',
    },
    'to8tkhlm': {
      'en': 'Bitcoin',
      'uk': '',
    },
    'a4atix45': {
      'en': '\$7,302',
      'uk': '',
    },
    'zliygpe1': {
      'en': '32% of portfolio',
      'uk': '',
    },
    '5g3gu7mi': {
      'en': ' ',
      'uk': '',
    },
    '4y0cgi27': {
      'en': 'Solona',
      'uk': '',
    },
    'wzbzikeg': {
      'en': '\$7,302',
      'uk': '',
    },
    '0c0rw0j1': {
      'en': '40% of portfolio',
      'uk': '',
    },
    '72z2c7jv': {
      'en': ' ',
      'uk': '',
    },
    'et8vcw3i': {
      'en': 'Dogecoin',
      'uk': '',
    },
    '1nz6rj32': {
      'en': '\$7,302',
      'uk': '',
    },
    'sniv0pyq': {
      'en': '40% of portfolio',
      'uk': '',
    },
    '4sgomcy9': {
      'en': ' ',
      'uk': '',
    },
    'i7mw2cac': {
      'en': 'Home',
      'uk': '',
    },
  },
  // stats
  {
    'm1oxje1a': {
      'en': 'Statistics',
      'uk': '',
    },
    'atkyy4p6': {
      'en': 'Earnings',
      'uk': '',
    },
    '9n0kr661': {
      'en': '\$10,000',
      'uk': '',
    },
    '0qinsxsw': {
      'en': 'Chart goes here',
      'uk': '',
    },
    'cuo2qhwz': {
      'en': 'Expenses',
      'uk': '',
    },
    'ywcehf11': {
      'en': '\$5,000',
      'uk': '',
    },
    'm4cv04jg': {
      'en': 'Chart goes here',
      'uk': '',
    },
    'my5j4xhc': {
      'en': 'Savings',
      'uk': '',
    },
    'kw8ifssb': {
      'en': '\$5,000',
      'uk': '',
    },
    '2pddapty': {
      'en': 'Chart goes here',
      'uk': '',
    },
  },
  // bookAppointment
  {
    'zrorcjqh': {
      'en': 'Book Appointment',
      'uk': '',
    },
    'jygtubgi': {
      'en':
          'Fill out the information below in order to book your appointment with our office.',
      'uk': '',
    },
    'n5qswkig': {
      'en': 'Emails will be sent to:',
      'uk': '',
    },
    '74lvhdev': {
      'en': 'Booking For',
      'uk': '',
    },
    '4fjfcfcq': {
      'en': 'Type of Appointment',
      'uk': '',
    },
    'scjyqimt': {
      'en': 'Doctors Visit',
      'uk': '',
    },
    'e930leel': {
      'en': 'Routine Checkup',
      'uk': '',
    },
    'xosm93g6': {
      'en': 'Scan/Update',
      'uk': '',
    },
    'qgdc3dc0': {
      'en': 'What\'s the problem?',
      'uk': '',
    },
    'vmbrxqkq': {
      'en': 'Choose Date',
      'uk': '',
    },
    'ishiv4ui': {
      'en': 'Cancel',
      'uk': '',
    },
    'a89kp78c': {
      'en': 'Book Now',
      'uk': '',
    },
  },
  // bookingOld
  {
    'i5v2o9e4': {
      'en': 'Book Appointment',
      'uk': '',
    },
    'dad03umo': {
      'en':
          'Fill out the information below in order to book your appointment with our office.',
      'uk': '',
    },
    'smvnt1tz': {
      'en': 'Email Address',
      'uk': '',
    },
    'qd9llo1s': {
      'en': 'Booking For',
      'uk': '',
    },
    'gzu1hlbf': {
      'en': 'Type of Appointment',
      'uk': '',
    },
    'sm5ikvo8': {
      'en': 'Doctors Visit',
      'uk': '',
    },
    'fttvwotz': {
      'en': 'Routine Checkup',
      'uk': '',
    },
    'cuuqk8p1': {
      'en': 'Scan/Update',
      'uk': '',
    },
    'iej7zkz1': {
      'en': 'What\'s the problem?',
      'uk': '',
    },
    'zmwixvq3': {
      'en': 'Choose Date',
      'uk': '',
    },
    '4d5emx3u': {
      'en': 'Cancel',
      'uk': '',
    },
    'chw8pzn3': {
      'en': 'Book Now',
      'uk': '',
    },
  },
  // editBooking
  {
    'ev561m07': {
      'en': 'Edit Appointment',
      'uk': '',
    },
    'ru15jnx0': {
      'en': 'Edit the fields below in order to change your appointment.',
      'uk': '',
    },
    'jn7bbrpm': {
      'en': 'Emails will be sent to:',
      'uk': '',
    },
    'cfzl8pxi': {
      'en': 'Booking For',
      'uk': '',
    },
    'vbmc6eg0': {
      'en': 'Type of Appointment',
      'uk': '',
    },
    'qs5nqx63': {
      'en': 'Doctors Visit',
      'uk': '',
    },
    'pl071lm2': {
      'en': 'Routine Checkup',
      'uk': '',
    },
    '2wngglno': {
      'en': 'Scan/Update',
      'uk': '',
    },
    'dp05zez3': {
      'en': 'What\'s the problem?',
      'uk': '',
    },
    'o8ct8zfm': {
      'en': 'Choose Date',
      'uk': '',
    },
    'yq7pzzmj': {
      'en': 'Cancel',
      'uk': '',
    },
    '6qi4aw0k': {
      'en': 'Save Changes',
      'uk': '',
    },
  },
  // pauseCard
  {
    'kbd2r30l': {
      'en': 'Pause Card',
      'uk': '',
    },
    'cd8atefx': {
      'en': 'Are you sure you want to pause your card?',
      'uk': '',
    },
    'lp6n80ck': {
      'en': 'Nevermind',
      'uk': '',
    },
    'rey1jhuv': {
      'en': 'Yes, Pause',
      'uk': '',
    },
  },
  // Miscellaneous
  {
    'lzyb73wy': {
      'en': '',
      'uk':
          'Щоб знімати фото або відео, цей застосунок потребує дозвіл до камери.',
    },
    'kx9cdks4': {
      'en': '',
      'uk':
          'Щоб загружати дані, цей застосунок потребує дозвіл до вашої галереї.',
    },
    'f0tqcmzw': {
      'en': '',
      'uk': '',
    },
    'wdpmtnkp': {
      'en': '',
      'uk': '',
    },
    'efvtwj7k': {
      'en': '',
      'uk': 'Помилка',
    },
    'ec5hfa1e': {
      'en': '',
      'uk': '',
    },
    'q5ljwvfo': {
      'en': '',
      'uk': '',
    },
    'j4rmwb3h': {
      'en': '',
      'uk': '',
    },
    '6ah1b18f': {
      'en': '',
      'uk': '',
    },
    '2kos1hen': {
      'en': '',
      'uk': '',
    },
    'au1mbdpn': {
      'en': '',
      'uk': '',
    },
    'hr12psls': {
      'en': '',
      'uk': '',
    },
    'qi7hbzsd': {
      'en': '',
      'uk': '',
    },
    'aox3s4fb': {
      'en': '',
      'uk': '',
    },
    'l8hv5a7z': {
      'en': '',
      'uk': '',
    },
    '4pjwb70a': {
      'en': '',
      'uk': '',
    },
    '0xlokf4y': {
      'en': '',
      'uk': '',
    },
    '8twlwiwt': {
      'en': '',
      'uk': '',
    },
    '8agscyz7': {
      'en': '',
      'uk': '',
    },
    're97rr32': {
      'en': '',
      'uk': '',
    },
    'marnyd1b': {
      'en': '',
      'uk': '',
    },
    '8ljk3pvv': {
      'en': '',
      'uk': '',
    },
    't4lu1eb9': {
      'en': '',
      'uk': '',
    },
    '3s5pjlj8': {
      'en': '',
      'uk': '',
    },
    't4xzlq9q': {
      'en': '',
      'uk': '',
    },
    '513nj4m0': {
      'en': '',
      'uk': '',
    },
    'a1jxfgju': {
      'en': '',
      'uk': '',
    },
  },
].reduce((a, b) => a..addAll(b));
