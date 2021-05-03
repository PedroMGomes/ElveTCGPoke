import 'package:flutter/foundation.dart' show kIsWeb; // check for web.
import 'package:elve_tcg_poke/utils/platform/platform_checker.dart';

PlatformChecker getPlatformChecker() => WebPlatformChecker();

/// Web Platform Checker.
class WebPlatformChecker implements PlatformChecker {
  @override
  bool isAndroid() => false;
  @override
  bool isDesktop() => false;
  @override
  bool isIOS() => false;
  @override
  bool isWeb() => kIsWeb;
}
