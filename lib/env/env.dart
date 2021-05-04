import 'package:envify/envify.dart';

part 'env.g.dart';

@Envify()
abstract class Env {
  static const String apiKey = _Env.apiKey;
  static const String authority = _Env.authority;
  static const String apiVersion = _Env.apiVersion;
}
