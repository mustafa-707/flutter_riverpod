// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../models/app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppSettings {

 String get locale; String get theme;
/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsCopyWith<AppSettings> get copyWith => _$AppSettingsCopyWithImpl<AppSettings>(this as AppSettings, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettings&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.theme, theme) || other.theme == theme));
}


@override
int get hashCode => Object.hash(runtimeType,locale,theme);

@override
String toString() {
  return 'AppSettings(locale: $locale, theme: $theme)';
}


}

/// @nodoc
abstract mixin class $AppSettingsCopyWith<$Res>  {
  factory $AppSettingsCopyWith(AppSettings value, $Res Function(AppSettings) _then) = _$AppSettingsCopyWithImpl;
@useResult
$Res call({
 String locale, String theme
});




}
/// @nodoc
class _$AppSettingsCopyWithImpl<$Res>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._self, this._then);

  final AppSettings _self;
  final $Res Function(AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? locale = null,Object? theme = null,}) {
  return _then(_self.copyWith(
locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _AppSettings extends AppSettings {
  const _AppSettings({this.locale = LocaleService.defaultLocale, this.theme = ThemeService.defaultTheme}): super._();
  

@override@JsonKey() final  String locale;
@override@JsonKey() final  String theme;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSettingsCopyWith<_AppSettings> get copyWith => __$AppSettingsCopyWithImpl<_AppSettings>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettings&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.theme, theme) || other.theme == theme));
}


@override
int get hashCode => Object.hash(runtimeType,locale,theme);

@override
String toString() {
  return 'AppSettings(locale: $locale, theme: $theme)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsCopyWith<$Res> implements $AppSettingsCopyWith<$Res> {
  factory _$AppSettingsCopyWith(_AppSettings value, $Res Function(_AppSettings) _then) = __$AppSettingsCopyWithImpl;
@override @useResult
$Res call({
 String locale, String theme
});




}
/// @nodoc
class __$AppSettingsCopyWithImpl<$Res>
    implements _$AppSettingsCopyWith<$Res> {
  __$AppSettingsCopyWithImpl(this._self, this._then);

  final _AppSettings _self;
  final $Res Function(_AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? locale = null,Object? theme = null,}) {
  return _then(_AppSettings(
locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
