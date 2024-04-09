// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `about us`
  String get aboutUs {
    return Intl.message(
      'about us',
      name: 'aboutUs',
      desc: '',
      args: []
    );
  }

  /// `Previous year questions`
  String get previousYearText {
    return Intl.message(
      'Previous year questions',
      name: 'previousYearText',
      desc: '',
      args: []
    );
  }

   /// `NEET previous years questions with tests and practice sets`
  String get previousYearSubText {
    return Intl.message(
      'NEET previous years questions with tests series and practice sets.',
      name: 'previousYearSubText',
      desc: '',
      args: []
    );
  }

  /// `Attempted tests`
  String get attemptedTestText {
    return Intl.message(
      'Attempted tests',
      name: 'attemptedTestText',
      desc: '',
      args: []
    );
  }

  /// `See your attempted test history with highlighted score.`
  String get attemptedTestSubText {
    return Intl.message(
      'See your attempted tests histories with highlighted scores.',
      name: 'attemptedTestText',
      desc: '',
      args: []
    );
  }

  /// `Syllabus`
  String get syllabusText {
    return Intl.message(
      'Syllabus',
      name: 'syllabusText',
      desc: '',
      args: []
    );
  }

  /// `A well organized chapter-wise syllabus for NEET aspirants.`
  String get syllabusSubText {
    return Intl.message(
      'A well organized chapter-wise syllabus for NEET aspirants.',
      name: 'syllabusSubText',
      desc: '',
      args: []
    );
  }

  /// `Bookmarked questions`
  String get bookmarkedQuesText {
    return Intl.message(
      'Bookmarked questions',
      name: 'bookmarkedQuesText',
      desc: '',
      args: []
    );
  }

  /// `Bookmarked questions from different test-series`
  String get bookmarkedQuesSubText {
    return Intl.message(
      'Save/Bookmark your favourite questions for later interaction.',
      name: 'bookmarkedQuesSubText',
      desc: '',
      args: []
    );
  }

  /// `enter your full name`
  String get fullNameText {
    return Intl.message(
      'enter your full name',
      name: 'fullNameText',
      desc: '',
      args: []
    );
  }

  /// `enter your email`
  String get emailHintText {
    return Intl.message(
      'enter your email address',
      name: 'emailHintText',
      desc: '',
      args: []
    );
  }

  /// `enter your phone number`
  String get phoneNumText {
    return Intl.message(
      'enter your phone number',
      name: 'phoneNumText',
      desc: '',
      args: []
    );
  }

  /// `enter your password`
  String get passwordText {
    return Intl.message(
      'enter password',
      name: 'phoneNumText',
      desc: '',
      args: []
    );
  }

  /// `enter confirm password`
  String get confirmPassword {
    return Intl.message(
      'enter confirm password',
      name: 'confirmPassword',
      desc: '',
      args: []
    );
  }

  /// `please enter your name`
  String get fullNameValidationText {
    return Intl.message(
      'please enter your name',
      name: 'fullNameText',
      desc: '',
      args: []
    );
  }

  /// `please enter valid email address`
  String get validEmailText {
    return Intl.message(
      'please enter valid email address',
      name: 'validEmailText',
      desc: '',
      args: []
    );
  }

  /// `password and confirm password doesn't match`
  String get validPassword {
    return Intl.message(
      "password and confirm password doesn't match",
      name: 'validPassword',
      desc: '',
      args: []
    );
  }

  /// `phone number should be of 10 digits`
  String get phoneValidationText {
    return Intl.message(
      "phone number should be of 10 digits",
      name: 'phoneValidationText',
      desc: '',
      args: []
    );
  }
}



class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}