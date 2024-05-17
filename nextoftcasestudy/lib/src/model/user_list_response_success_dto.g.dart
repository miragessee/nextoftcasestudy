// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_response_success_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserListResponseSuccessDto extends UserListResponseSuccessDto {
  @override
  final bool? success;
  @override
  final BuiltList<String>? messages;
  @override
  final UserListResponse? data;
  @override
  final HttpStatusCode? status;

  factory _$UserListResponseSuccessDto(
          [void Function(UserListResponseSuccessDtoBuilder)? updates]) =>
      (new UserListResponseSuccessDtoBuilder()..update(updates))._build();

  _$UserListResponseSuccessDto._(
      {this.success, this.messages, this.data, this.status})
      : super._();

  @override
  UserListResponseSuccessDto rebuild(
          void Function(UserListResponseSuccessDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserListResponseSuccessDtoBuilder toBuilder() =>
      new UserListResponseSuccessDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserListResponseSuccessDto &&
        success == other.success &&
        messages == other.messages &&
        data == other.data &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, messages.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserListResponseSuccessDto')
          ..add('success', success)
          ..add('messages', messages)
          ..add('data', data)
          ..add('status', status))
        .toString();
  }
}

class UserListResponseSuccessDtoBuilder
    implements
        Builder<UserListResponseSuccessDto, UserListResponseSuccessDtoBuilder> {
  _$UserListResponseSuccessDto? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  ListBuilder<String>? _messages;
  ListBuilder<String> get messages =>
      _$this._messages ??= new ListBuilder<String>();
  set messages(ListBuilder<String>? messages) => _$this._messages = messages;

  UserListResponseBuilder? _data;
  UserListResponseBuilder get data =>
      _$this._data ??= new UserListResponseBuilder();
  set data(UserListResponseBuilder? data) => _$this._data = data;

  HttpStatusCode? _status;
  HttpStatusCode? get status => _$this._status;
  set status(HttpStatusCode? status) => _$this._status = status;

  UserListResponseSuccessDtoBuilder() {
    UserListResponseSuccessDto._defaults(this);
  }

  UserListResponseSuccessDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _messages = $v.messages?.toBuilder();
      _data = $v.data?.toBuilder();
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserListResponseSuccessDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserListResponseSuccessDto;
  }

  @override
  void update(void Function(UserListResponseSuccessDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserListResponseSuccessDto build() => _build();

  _$UserListResponseSuccessDto _build() {
    _$UserListResponseSuccessDto _$result;
    try {
      _$result = _$v ??
          new _$UserListResponseSuccessDto._(
              success: success,
              messages: _messages?.build(),
              data: _data?.build(),
              status: status);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'messages';
        _messages?.build();
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserListResponseSuccessDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
