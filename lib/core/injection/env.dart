enum Environment { development, production, staging, testing }

extension EnvironmentExtension on Environment {
  String get value {
    switch (this) {
      case Environment.development:
        return 'development';
      case Environment.production:
        return 'production';
      case Environment.staging:
        return 'staging';
      case Environment.testing:
        return 'testing';
      default:
        return 'development';
    }
  }

  String get baseURL {
    switch (this) {
      case Environment.development:
        return 'graphql-pokemon2.vercel.app';
      case Environment.production:
        return 'graphql-pokemon2.vercel.app';
      case Environment.staging:
        return 'https://staging.com';
      case Environment.testing:
        return 'https://testing.com';
      default:
        return 'http://localhost:3000';
    }
  }

  String get baseURLFull {
    switch (this) {
      case Environment.development:
        return 'https://graphql-pokemon2.vercel.app';
      case Environment.production:
        return 'https://graphql-pokemon2.vercel.app';
      case Environment.staging:
        return 'https://staging.com';
      case Environment.testing:
        return 'https://testing.com';
      default:
        return 'http://localhost:3000';
    }
  }

  bool get isDevelopMode {
    switch (this) {
      case Environment.development:
        return true;
      case Environment.production:
        return false;
      case Environment.staging:
        return false;
      case Environment.testing:
        return true;
      default:
        return true;
    }
  }
}
