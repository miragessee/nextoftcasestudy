// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_image_response_success_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UploadImageResponseSuccessDto extends UploadImageResponseSuccessDto {
  @override
  final bool? success;
  @override
  final BuiltList<String>? messages;
  @override
  final UploadImageResponse? data;
  @override
  final HttpStatusCode? status;

  factory _$UploadImageResponseSuccessDto(
          [void Function(UploadImageResponseSuccessDtoBuilder)? updates]) =>
      (new UploadImageResponseSuccessDtoBuilder()..update(updates))._build();

  _$UploadImageResponseSuccessDto._(
      {this.success, this.messages, this.data, this.status})
      : super._();

  @override
  UploadImageResponseSuccessDto rebuild(
          void Function(UploadImageResponseSuccessDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UploadImageResponseSuccessDtoBuilder toBuilder() =>
      new UploadImageResponseSuccessDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UploadImageResponseSuccessDto &&
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
    return (newBuiltValueToStringHelper(r'UploadImageResponseSuccessDto')
          ..add('success', success)
          ..add('messages', messages)
          ..add('data', data)
          ..add('status', status))
        .toString();
  }
}

class UploadImageResponseSuccessDtoBuilder
    implements
        Builder<UploadImageResponseSuccessDto,
            UploadImageResponseSuccessDtoBuilder> {
  _$UploadImageResponseSuccessDto? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  ListBuilder<String>? _messages;
  ListBuilder<String> get messages =>
      _$this._messages ??= new ListBuilder<String>();
  set messages(ListBuilder<String>? messages) => _$this._messages = messages;

  UploadImageResponseBuilder? _data;
  UploadImageResponseBuilder get data =>
      _$this._data ??= new UploadImageResponseBuilder();
  set data(UploadImageResponseBuilder? data) => _$this._data = data;

  HttpStatusCode? _status;
  HttpStatusCode? get status => _$this._status;
  set status(HttpStatusCode? status) => _$this._status = status;

  UploadImageResponseSuccessDtoBuilder() {
    UploadImageResponseSuccessDto._defaults(this);
  }

  UploadImageResponseSuccessDtoBuilder get _$this {
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
  void replace(UploadImageResponseSuccessDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UploadImageResponseSuccessDto;
  }

  @override
  void update(void Function(UploadImageResponseSuccessDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UploadImageResponseSuccessDto build() => _build();

  _$UploadImageResponseSuccessDto _build() {
    _$UploadImageResponseSuccessDto _$result;
    try {
      _$result = _$v ??
          new _$UploadImageResponseSuccessDto._(
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
            r'UploadImageResponseSuccessDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
