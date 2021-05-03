import 'dart:io';
import 'package:elve_tcg_poke/utils/platform/platform_checker.dart';

PlatformChecker getPlatformChecker() => NativePlatformChecker();

/// Native Platform checker.
class NativePlatformChecker implements PlatformChecker {
  @override
  bool isAndroid() => Platform.isAndroid;
  @override
  bool isDesktop() =>
      Platform.isMacOS || Platform.isWindows || Platform.isLinux;
  @override
  bool isIOS() => Platform.isIOS;
  @override
  bool isWeb() => false;
}
