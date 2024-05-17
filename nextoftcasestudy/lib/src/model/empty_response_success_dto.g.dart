// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empty_response_success_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EmptyResponseSuccessDto extends EmptyResponseSuccessDto {
  @override
  final bool? success;
  @override
  final BuiltList<String>? messages;
  @override
  final JsonObject? data;
  @override
  final HttpStatusCode? status;

  factory _$EmptyResponseSuccessDto(
          [void Function(EmptyResponseSuccessDtoBuilder)? updates]) =>
      (new EmptyResponseSuccessDtoBuilder()..update(updates))._build();

  _$EmptyResponseSuccessDto._(
      {this.success, this.messages, this.data, this.status})
      : super._();

  @override
  EmptyResponseSuccessDto rebuild(
          void Function(EmptyResponseSuccessDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EmptyResponseSuccessDtoBuilder toBuilder() =>
      new EmptyResponseSuccessDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EmptyResponseSuccessDto &&
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
    return (newBuiltValueToStringHelper(r'EmptyResponseSuccessDto')
          ..add('success', success)
          ..add('messages', messages)
          ..add('data', data)
          ..add('status', status))
        .toString();
  }
}

class EmptyResponseSuccessDtoBuilder
    implements
        Builder<EmptyResponseSuccessDto, EmptyResponseSuccessDtoBuilder> {
  _$EmptyResponseSuccessDto? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  ListBuilder<String>? _messages;
  ListBuilder<String> get messages =>
      _$this._messages ??= new ListBuilder<String>();
  set messages(ListBuilder<String>? messages) => _$this._messages = messages;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  HttpStatusCode? _status;
  HttpStatusCode? get status => _$this._status;
  set status(HttpStatusCode? status) => _$this._status = status;

  EmptyResponseSuccessDtoBuilder() {
    EmptyResponseSuccessDto._defaults(this);
  }

  EmptyResponseSuccessDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _messages = $v.messages?.toBuilder();
      _data = $v.data;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EmptyResponseSuccessDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EmptyResponseSuccessDto;
  }

  @override
  void update(void Function(EmptyResponseSuccessDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EmptyResponseSuccessDto build() => _build();

  _$EmptyResponseSuccessDto _build() {
    _$EmptyResponseSuccessDto _$result;
    try {
      _$result = _$v ??
          new _$EmptyResponseSuccessDto._(
              success: success,
              messages: _messages?.build(),
              data: data,
              status: status);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'messages';
        _messages?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EmptyResponseSuccessDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
