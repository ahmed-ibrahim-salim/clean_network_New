// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videos_for_chef.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideosForChefModel _$VideosForChefModelFromJson(Map<String, dynamic> json) =>
    VideosForChefModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      success: json['success'] as bool?,
    );

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as int?,
      tutorialId: json['tutorial_ id'] as int?,
      title: json['title'] as String?,
      caption: json['caption'] as String?,
      url: json['url'] as String?,
      main: json['main'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      chef: json['chef'] == null
          ? null
          : Chef.fromJson(json['chef'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      viewsCount: json['views_count'] as int?,
      commentsCount: json['comments_count'] as int?,
      sharesCount: json['shares_count'] as int?,
      favouritesCount: json['favourites_count'] as int?,
      isFavourited: json['is_favourited'] as bool?,
      isBookmarked: json['is_bookmarked'] as bool?,
    );

Chef _$ChefFromJson(Map<String, dynamic> json) => Chef(
      id: json['id'] as int?,
      name: json['name'] as String?,
      avatarPath: json['avatar_path'] as String?,
      isFollowing: json['is_following'] as bool?,
      regionalCuisinesCount: json['regional_cuisines_count'] as int?,
    );

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      first: json['first'] as String?,
      last: json['last'] as String?,
      prev: json['prev'],
      next: json['next'],
    );

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      currentPage: json['current_page'] as int?,
      from: json['from'] as int?,
      lastPage: json['last_page'] as int?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: json['path'] as String?,
      perPage: json['per_page'] as int?,
      to: json['to'] as int?,
      total: json['total'] as int?,
      message: json['message'],
    );

Link _$LinkFromJson(Map<String, dynamic> json) => Link(
      url: json['url'] as String?,
      label: json['label'] as String?,
      active: json['active'] as bool?,
    );
