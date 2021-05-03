import 'package:elve_tcg_poke/utils/platform/platform_checker_stub.dart'
    if (dart.library.io) 'package:elve_tcg_poke/utils/platform/native_platform_checker.dart'
    if (dart.library.js) 'package:elve_tcg_poke/utils/platform/web_platform_checker.dart';

abstract class PlatformChecker {
  bool isWeb();
  bool isIOS();
  bool isAndroid();
  bool isDesktop();

  factory PlatformChecker() => getPlatformChecker();
}
