import 'package:architecture_project/core/injection/env.dart';
import 'package:architecture_project/main.dart';

class Injection {
  static const String fontFamily = 'Inter';
  // static final AppSharedPrefKey sharedPrefKey = AppSharedPrefKey();
  // static final HttpClient httpClient = AppHttpClient.create();
  // static final HeaderProvider headerProvider = AppHeaderProvider.create();
  static final String baseURL = env.baseURL;
  static final bool isDevelopment = env.isDevelopMode;
}
