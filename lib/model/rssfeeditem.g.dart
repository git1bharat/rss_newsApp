// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rssfeeditem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsModelImpl _$$NewsModelImplFromJson(Map<String, dynamic> json) =>
    _$NewsModelImpl(
      title: json['title'] as String,
      link: json['link'] as String?,
      url: json['url'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$NewsModelImplToJson(_$NewsModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'link': instance.link,
      'url': instance.url,
      'description': instance.description,
    };
