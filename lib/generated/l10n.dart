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

  /// `MAO TRAILER`
  String get MAO_TRAILER {
    return Intl.message(
      'MAO TRAILER',
      name: 'MAO_TRAILER',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get Next {
    return Intl.message(
      'Next',
      name: 'Next',
      desc: '',
      args: [],
    );
  }

  /// `Get Stared`
  String get Get_Stared {
    return Intl.message(
      'Get Stared',
      name: 'Get_Stared',
      desc: '',
      args: [],
    );
  }

  /// `Get the first \nMovie &TV information`
  String get Get_the_firstMovie {
    return Intl.message(
      'Get the first \nMovie &TV information',
      name: 'Get_the_firstMovie',
      desc: '',
      args: [],
    );
  }

  /// `Know the movie \nis not worth Watching`
  String get Know_the_movie {
    return Intl.message(
      'Know the movie \nis not worth Watching',
      name: 'Know_the_movie',
      desc: '',
      args: [],
    );
  }

  /// `Real-time \nupdates movie Trailer`
  String get Real_time_updates {
    return Intl.message(
      'Real-time \nupdates movie Trailer',
      name: 'Real_time_updates',
      desc: '',
      args: [],
    );
  }

  /// `choose the language`
  String get choose_the_language {
    return Intl.message(
      'choose the language',
      name: 'choose_the_language',
      desc: '',
      args: [],
    );
  }

  /// `MOVIES`
  String get MOVIES {
    return Intl.message(
      'MOVIES',
      name: 'MOVIES',
      desc: '',
      args: [],
    );
  }

  /// `Now`
  String get Now {
    return Intl.message(
      'Now',
      name: 'Now',
      desc: '',
      args: [],
    );
  }

  /// `Popular`
  String get Popular {
    return Intl.message(
      'Popular',
      name: 'Popular',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get Back {
    return Intl.message(
      'Back',
      name: 'Back',
      desc: '',
      args: [],
    );
  }

  /// `People watching`
  String get People_watching {
    return Intl.message(
      'People watching',
      name: 'People_watching',
      desc: '',
      args: [],
    );
  }

  /// `Some thing wrong`
  String get Some_thing_wrong {
    return Intl.message(
      'Some thing wrong',
      name: 'Some_thing_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Reload data`
  String get Reload_Data {
    return Intl.message(
      'Reload data',
      name: 'Reload_Data',
      desc: '',
      args: [],
    );
  }

  /// `There may be a problem with the network`
  String get There_may_be_a_problem_with_the_network {
    return Intl.message(
      'There may be a problem with the network',
      name: 'There_may_be_a_problem_with_the_network',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'zh'),
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
