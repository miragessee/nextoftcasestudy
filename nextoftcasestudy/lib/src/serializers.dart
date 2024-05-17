//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:nextoftcasestudy/src/date_serializer.dart';
import 'package:nextoftcasestudy/src/model/date.dart';

import 'package:nextoftcasestudy/src/model/create_user_request.dart';
import 'package:nextoftcasestudy/src/model/empty_response_success_dto.dart';
import 'package:nextoftcasestudy/src/model/http_status_code.dart';
import 'package:nextoftcasestudy/src/model/update_user_request.dart';
import 'package:nextoftcasestudy/src/model/upload_image_response.dart';
import 'package:nextoftcasestudy/src/model/upload_image_response_success_dto.dart';
import 'package:nextoftcasestudy/src/model/user_list_response.dart';
import 'package:nextoftcasestudy/src/model/user_list_response_success_dto.dart';
import 'package:nextoftcasestudy/src/model/user_response.dart';
import 'package:nextoftcasestudy/src/model/user_response_success_dto.dart';

part 'serializers.g.dart';

@SerializersFor([
  CreateUserRequest,
  EmptyResponseSuccessDto,
  HttpStatusCode,
  UpdateUserRequest,
  UploadImageResponse,
  UploadImageResponseSuccessDto,
  UserListResponse,
  UserListResponseSuccessDto,
  UserResponse,
  UserResponseSuccessDto,
])
Serializers serializers = (_$serializers.toBuilder()
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
