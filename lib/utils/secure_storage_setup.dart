import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorageSetup {
  static AndroidOptions getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  static FlutterSecureStorage storage =
      FlutterSecureStorage(aOptions: getAndroidOptions());
}
