//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'upload_image_response.g.dart';

/// UploadImageResponse
///
/// Properties:
/// * [imageUrl] 
@BuiltValue()
abstract class UploadImageResponse implements Built<UploadImageResponse, UploadImageResponseBuilder> {
  @BuiltValueField(wireName: r'imageUrl')
  String? get imageUrl;

  UploadImageResponse._();

  factory UploadImageResponse([void updates(UploadImageResponseBuilder b)]) = _$UploadImageResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UploadImageResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UploadImageResponse> get serializer => _$UploadImageResponseSerializer();
}

class _$UploadImageResponseSerializer implements PrimitiveSerializer<UploadImageResponse> {
  @override
  final Iterable<Type> types = const [UploadImageResponse, _$UploadImageResponse];

  @override
  final String wireName = r'UploadImageResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UploadImageResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.imageUrl != null) {
      yield r'imageUrl';
      yield serializers.serialize(
        object.imageUrl,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UploadImageResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UploadImageResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'imageUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.imageUrl = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UploadImageResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UploadImageResponseBuilder();
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

