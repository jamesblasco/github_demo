import 'package:flutter_secure_storage/flutter_secure_storage.dart'
    as flutter_secure_storage;
import 'package:flutter_test/flutter_test.dart';
import 'package:github_demo/src/services/auth/credentials_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockFlutterSecureStorage extends Mock
    implements flutter_secure_storage.FlutterSecureStorage {}

void main() {
  group('AuthCredentialsRepository', () {
    late MockFlutterSecureStorage secureStorage;
    late AuthCredentialsRepository authCredentialsRepository;

    setUp(() {
      secureStorage = MockFlutterSecureStorage();

      authCredentialsRepository = AuthCredentialsRepository(
        storage: secureStorage,
      );
    });

    group('getCredentials', () {
      setUp(() {
        when(
          () => secureStorage.read(key: AuthCredentialsRepository.key),
        ).thenAnswer((_) => Future.value(''));
      });

      test('calls getCredentials', () async {
        await authCredentialsRepository.readAuthCredentials();
        verify(
          () => secureStorage.read(key: AuthCredentialsRepository.key),
        ).called(1);
      });

      test('succeeds when getCredentials succeeds', () async {
        expect(
          authCredentialsRepository.readAuthCredentials(),
          completes,
        );
      });
    });
  });
}
