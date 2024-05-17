import 'package:test/test.dart';
import 'package:nextoftcasestudy/openapi.dart';


/// tests for UserApi
void main() {
  final instance = Openapi().getUserApi();

  group(UserApi, () {
    //Future<UserListResponseSuccessDto> apiUserGet({ String search, int skip, int take }) async
    test('test apiUserGet', () async {
      // TODO
    });

    //Future<EmptyResponseSuccessDto> apiUserIdDelete(String id) async
    test('test apiUserIdDelete', () async {
      // TODO
    });

    //Future<UserResponseSuccessDto> apiUserIdGet(String id) async
    test('test apiUserIdGet', () async {
      // TODO
    });

    // Update user, use null not to update specific field.
    //
    //Future<UserResponseSuccessDto> apiUserIdPut(String id, { UpdateUserRequest updateUserRequest }) async
    test('test apiUserIdPut', () async {
      // TODO
    });

    //Future<UserResponseSuccessDto> apiUserPost({ CreateUserRequest createUserRequest }) async
    test('test apiUserPost', () async {
      // TODO
    });

    // Upload image
    //
    //Future<UploadImageResponseSuccessDto> apiUserUploadImagePost({ MultipartFile image }) async
    test('test apiUserUploadImagePost', () async {
      // TODO
    });

  });
}
