// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserListResponse extends UserListResponse {
  @override
  final BuiltList<UserResponse>? users;

  factory _$UserListResponse(
          [void Function(UserListResponseBuilder)? updates]) =>
      (new UserListResponseBuilder()..update(updates))._build();

  _$UserListResponse._({this.users}) : super._();

  @override
  UserListResponse rebuild(void Function(UserListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserListResponseBuilder toBuilder() =>
      new UserListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserListResponse && users == other.users;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, users.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserListResponse')
          ..add('users', users))
        .toString();
  }
}

class UserListResponseBuilder
    implements Builder<UserListResponse, UserListResponseBuilder> {
  _$UserListResponse? _$v;

  ListBuilder<UserResponse>? _users;
  ListBuilder<UserResponse> get users =>
      _$this._users ??= new ListBuilder<UserResponse>();
  set users(ListBuilder<UserResponse>? users) => _$this._users = users;

  UserListResponseBuilder() {
    UserListResponse._defaults(this);
  }

  UserListResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _users = $v.users?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserListResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserListResponse;
  }

  @override
  void update(void Function(UserListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserListResponse build() => _build();

  _$UserListResponse _build() {
    _$UserListResponse _$result;
    try {
      _$result = _$v ?? new _$UserListResponse._(users: _users?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'users';
        _users?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
