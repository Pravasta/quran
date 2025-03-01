import 'package:quran/core/injection/env.dart';
import 'package:quran/main.dart';

class Injection {
  static const String fontFamily = 'Inter';
  // static final AppSharedPrefKey sharedPrefKey = AppSharedPrefKey();
  // static final HttpClient httpClient = AppHttpClient.create();
  // static final HeaderProvider headerProvider = AppHeaderProvider.create();
  static final String baseURL = env.baseURL;
  static final bool isDevelopment = env.isDevelopMode;
}
