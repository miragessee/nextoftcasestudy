//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:nextoftcasestudy/src/model/http_status_code.dart';
import 'package:nextoftcasestudy/src/model/upload_image_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'upload_image_response_success_dto.g.dart';

/// UploadImageResponseSuccessDto
///
/// Properties:
/// * [success] 
/// * [messages] 
/// * [data] 
/// * [status] 
@BuiltValue()
abstract class UploadImageResponseSuccessDto implements Built<UploadImageResponseSuccessDto, UploadImageResponseSuccessDtoBuilder> {
  @BuiltValueField(wireName: r'success')
  bool? get success;

  @BuiltValueField(wireName: r'messages')
  BuiltList<String>? get messages;

  @BuiltValueField(wireName: r'data')
  UploadImageResponse? get data;

  @BuiltValueField(wireName: r'status')
  HttpStatusCode? get status;
  // enum statusEnum {  100,  101,  102,  103,  200,  201,  202,  203,  204,  205,  206,  207,  208,  226,  300,  301,  302,  303,  304,  305,  306,  307,  308,  400,  401,  402,  403,  404,  405,  406,  407,  408,  409,  410,  411,  412,  413,  414,  415,  416,  417,  421,  422,  423,  424,  426,  428,  429,  431,  451,  500,  501,  502,  503,  504,  505,  506,  507,  508,  510,  511,  };

  UploadImageResponseSuccessDto._();

  factory UploadImageResponseSuccessDto([void updates(UploadImageResponseSuccessDtoBuilder b)]) = _$UploadImageResponseSuccessDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UploadImageResponseSuccessDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UploadImageResponseSuccessDto> get serializer => _$UploadImageResponseSuccessDtoSerializer();
}

class _$UploadImageResponseSuccessDtoSerializer implements PrimitiveSerializer<UploadImageResponseSuccessDto> {
  @override
  final Iterable<Type> types = const [UploadImageResponseSuccessDto, _$UploadImageResponseSuccessDto];

  @override
  final String wireName = r'UploadImageResponseSuccessDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UploadImageResponseSuccessDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.success != null) {
      yield r'success';
      yield serializers.serialize(
        object.success,
        specifiedType: const FullType(bool),
      );
    }
    if (object.messages != null) {
      yield r'messages';
      yield serializers.serialize(
        object.messages,
        specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
      );
    }
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(UploadImageResponse),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(HttpStatusCode),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UploadImageResponseSuccessDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UploadImageResponseSuccessDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'success':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.success = valueDes;
          break;
        case r'messages':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.messages.replace(valueDes);
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UploadImageResponse),
          ) as UploadImageResponse;
          result.data.replace(valueDes);
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(HttpStatusCode),
          ) as HttpStatusCode;
          result.status = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UploadImageResponseSuccessDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UploadImageResponseSuccessDtoBuilder();
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

