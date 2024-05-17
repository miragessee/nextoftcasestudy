//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:nextoftcasestudy/src/model/user_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_list_response.g.dart';

/// UserListResponse
///
/// Properties:
/// * [users] 
@BuiltValue()
abstract class UserListResponse implements Built<UserListResponse, UserListResponseBuilder> {
  @BuiltValueField(wireName: r'users')
  BuiltList<UserResponse>? get users;

  UserListResponse._();

  factory UserListResponse([void updates(UserListResponseBuilder b)]) = _$UserListResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserListResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserListResponse> get serializer => _$UserListResponseSerializer();
}

class _$UserListResponseSerializer implements PrimitiveSerializer<UserListResponse> {
  @override
  final Iterable<Type> types = const [UserListResponse, _$UserListResponse];

  @override
  final String wireName = r'UserListResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.users != null) {
      yield r'users';
      yield serializers.serialize(
        object.users,
        specifiedType: const FullType.nullable(BuiltList, [FullType(UserResponse)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UserListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserListResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'users':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(UserResponse)]),
          ) as BuiltList<UserResponse>?;
          if (valueDes == null) continue;
          result.users.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserListResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserListResponseBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

