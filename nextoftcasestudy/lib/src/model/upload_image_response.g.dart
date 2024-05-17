// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_image_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UploadImageResponse extends UploadImageResponse {
  @override
  final String? imageUrl;

  factory _$UploadImageResponse(
          [void Function(UploadImageResponseBuilder)? updates]) =>
      (new UploadImageResponseBuilder()..update(updates))._build();

  _$UploadImageResponse._({this.imageUrl}) : super._();

  @override
  UploadImageResponse rebuild(
          void Function(UploadImageResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UploadImageResponseBuilder toBuilder() =>
      new UploadImageResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UploadImageResponse && imageUrl == other.imageUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UploadImageResponse')
          ..add('imageUrl', imageUrl))
        .toString();
  }
}

class UploadImageResponseBuilder
    implements Builder<UploadImageResponse, UploadImageResponseBuilder> {
  _$UploadImageResponse? _$v;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  UploadImageResponseBuilder() {
    UploadImageResponse._defaults(this);
  }

  UploadImageResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _imageUrl = $v.imageUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UploadImageResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UploadImageResponse;
  }

  @override
  void update(void Function(UploadImageResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UploadImageResponse build() => _build();

  _$UploadImageResponse _build() {
    final _$result = _$v ?? new _$UploadImageResponse._(imageUrl: imageUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
