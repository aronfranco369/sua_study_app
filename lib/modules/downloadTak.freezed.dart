// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'downloadTak.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DownloadTaskk {
  String get documentName => throw _privateConstructorUsedError;
  String get downloadUrl => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;
  List<String> get downloadTasks => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get downloadedDocuments =>
      throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get openedDocuments =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DownloadTaskkCopyWith<DownloadTaskk> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadTaskkCopyWith<$Res> {
  factory $DownloadTaskkCopyWith(
          DownloadTaskk value, $Res Function(DownloadTaskk) then) =
      _$DownloadTaskkCopyWithImpl<$Res, DownloadTaskk>;
  @useResult
  $Res call(
      {String documentName,
      String downloadUrl,
      double progress,
      List<String> downloadTasks,
      List<Map<String, dynamic>> downloadedDocuments,
      List<Map<String, dynamic>> openedDocuments});
}

/// @nodoc
class _$DownloadTaskkCopyWithImpl<$Res, $Val extends DownloadTaskk>
    implements $DownloadTaskkCopyWith<$Res> {
  _$DownloadTaskkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentName = null,
    Object? downloadUrl = null,
    Object? progress = null,
    Object? downloadTasks = null,
    Object? downloadedDocuments = null,
    Object? openedDocuments = null,
  }) {
    return _then(_value.copyWith(
      documentName: null == documentName
          ? _value.documentName
          : documentName // ignore: cast_nullable_to_non_nullable
              as String,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      downloadTasks: null == downloadTasks
          ? _value.downloadTasks
          : downloadTasks // ignore: cast_nullable_to_non_nullable
              as List<String>,
      downloadedDocuments: null == downloadedDocuments
          ? _value.downloadedDocuments
          : downloadedDocuments // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      openedDocuments: null == openedDocuments
          ? _value.openedDocuments
          : openedDocuments // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DownloadTaskkImplCopyWith<$Res>
    implements $DownloadTaskkCopyWith<$Res> {
  factory _$$DownloadTaskkImplCopyWith(
          _$DownloadTaskkImpl value, $Res Function(_$DownloadTaskkImpl) then) =
      __$$DownloadTaskkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String documentName,
      String downloadUrl,
      double progress,
      List<String> downloadTasks,
      List<Map<String, dynamic>> downloadedDocuments,
      List<Map<String, dynamic>> openedDocuments});
}

/// @nodoc
class __$$DownloadTaskkImplCopyWithImpl<$Res>
    extends _$DownloadTaskkCopyWithImpl<$Res, _$DownloadTaskkImpl>
    implements _$$DownloadTaskkImplCopyWith<$Res> {
  __$$DownloadTaskkImplCopyWithImpl(
      _$DownloadTaskkImpl _value, $Res Function(_$DownloadTaskkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentName = null,
    Object? downloadUrl = null,
    Object? progress = null,
    Object? downloadTasks = null,
    Object? downloadedDocuments = null,
    Object? openedDocuments = null,
  }) {
    return _then(_$DownloadTaskkImpl(
      documentName: null == documentName
          ? _value.documentName
          : documentName // ignore: cast_nullable_to_non_nullable
              as String,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      downloadTasks: null == downloadTasks
          ? _value._downloadTasks
          : downloadTasks // ignore: cast_nullable_to_non_nullable
              as List<String>,
      downloadedDocuments: null == downloadedDocuments
          ? _value._downloadedDocuments
          : downloadedDocuments // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      openedDocuments: null == openedDocuments
          ? _value._openedDocuments
          : openedDocuments // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$DownloadTaskkImpl extends _DownloadTaskk {
  const _$DownloadTaskkImpl(
      {required this.documentName,
      required this.downloadUrl,
      required this.progress,
      required final List<String> downloadTasks,
      required final List<Map<String, dynamic>> downloadedDocuments,
      required final List<Map<String, dynamic>> openedDocuments})
      : _downloadTasks = downloadTasks,
        _downloadedDocuments = downloadedDocuments,
        _openedDocuments = openedDocuments,
        super._();

  @override
  final String documentName;
  @override
  final String downloadUrl;
  @override
  final double progress;
  final List<String> _downloadTasks;
  @override
  List<String> get downloadTasks {
    if (_downloadTasks is EqualUnmodifiableListView) return _downloadTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_downloadTasks);
  }

  final List<Map<String, dynamic>> _downloadedDocuments;
  @override
  List<Map<String, dynamic>> get downloadedDocuments {
    if (_downloadedDocuments is EqualUnmodifiableListView)
      return _downloadedDocuments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_downloadedDocuments);
  }

  final List<Map<String, dynamic>> _openedDocuments;
  @override
  List<Map<String, dynamic>> get openedDocuments {
    if (_openedDocuments is EqualUnmodifiableListView) return _openedDocuments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_openedDocuments);
  }

  @override
  String toString() {
    return 'DownloadTaskk(documentName: $documentName, downloadUrl: $downloadUrl, progress: $progress, downloadTasks: $downloadTasks, downloadedDocuments: $downloadedDocuments, openedDocuments: $openedDocuments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadTaskkImpl &&
            (identical(other.documentName, documentName) ||
                other.documentName == documentName) &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            const DeepCollectionEquality()
                .equals(other._downloadTasks, _downloadTasks) &&
            const DeepCollectionEquality()
                .equals(other._downloadedDocuments, _downloadedDocuments) &&
            const DeepCollectionEquality()
                .equals(other._openedDocuments, _openedDocuments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      documentName,
      downloadUrl,
      progress,
      const DeepCollectionEquality().hash(_downloadTasks),
      const DeepCollectionEquality().hash(_downloadedDocuments),
      const DeepCollectionEquality().hash(_openedDocuments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadTaskkImplCopyWith<_$DownloadTaskkImpl> get copyWith =>
      __$$DownloadTaskkImplCopyWithImpl<_$DownloadTaskkImpl>(this, _$identity);
}

abstract class _DownloadTaskk extends DownloadTaskk {
  const factory _DownloadTaskk(
          {required final String documentName,
          required final String downloadUrl,
          required final double progress,
          required final List<String> downloadTasks,
          required final List<Map<String, dynamic>> downloadedDocuments,
          required final List<Map<String, dynamic>> openedDocuments}) =
      _$DownloadTaskkImpl;
  const _DownloadTaskk._() : super._();

  @override
  String get documentName;
  @override
  String get downloadUrl;
  @override
  double get progress;
  @override
  List<String> get downloadTasks;
  @override
  List<Map<String, dynamic>> get downloadedDocuments;
  @override
  List<Map<String, dynamic>> get openedDocuments;
  @override
  @JsonKey(ignore: true)
  _$$DownloadTaskkImplCopyWith<_$DownloadTaskkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
