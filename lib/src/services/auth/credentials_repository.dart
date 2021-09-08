import 'package:flutter_secure_storage/flutter_secure_storage.dart';



class AuthCredentialsRepository {

   static const key = 'Auth_Credentials'; 
  final FlutterSecureStorage storage;

  const AuthCredentialsRepository({required this.storage});

  Future<String?> readAuthCredentials() async {
    return storage.read(key: key);
  }

  Future<void> writeAuthCredentials(String value) async {
    await storage.write(key: key, value: value);
  }

  Future<void> deleteAuthCredentials() async {
    return storage.delete(key: key);
  }
}
