import 'package:elve_tcg_poke/utils/platform/platform_checker.dart';

PlatformChecker getPlatformChecker() => throw UnsupportedError(
      'Cannot create a `PlatformChecker` without the packages dart:html or dart:io.',
    );
