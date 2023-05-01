import 'package:json_annotation/json_annotation.dart';

import '../network/interfaces/base_client_generator.dart';


part 'videos_for_chef.g.dart';

@JsonSerializable(createToJson: false)
class VideosForChefModel implements BaseNetworkModel<VideosForChefModel> {
  VideosForChefModel({
    this.data,
    this.links,
    this.meta,
    this.success,
  });

// you can use late
  // VideosForChefModel();
  // late String username;

  final List<Datum>? data;
  final Links? links;
  final Meta? meta;
  final bool? success;

  factory VideosForChefModel.fromJson(Map<String, dynamic> json) =>
      _$VideosForChefModelFromJson(json);

// from abstract class (inheritance because the usage of extends)
  @override
  VideosForChefModel fromJson(Map<String, dynamic> json) {
    return VideosForChefModel.fromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class Datum {
  Datum({
    required this.id,
    required this.tutorialId,
    required this.title,
    required this.caption,
    required this.url,
    required this.main,
    required this.createdAt,
    required this.chef,
    required this.tags,
    required this.viewsCount,
    required this.commentsCount,
    required this.sharesCount,
    required this.favouritesCount,
    required this.isFavourited,
    required this.isBookmarked,
  });

  final int? id;

  @JsonKey(name: 'tutorial_ id')
  final int? tutorialId;
  final String? title;
  final String? caption;
  final String? url;
  final bool? main;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  final Chef? chef;
  final List<String>? tags;

  @JsonKey(name: 'views_count')
  final int? viewsCount;

  @JsonKey(name: 'comments_count')
  final int? commentsCount;

  @JsonKey(name: 'shares_count')
  final int? sharesCount;

  @JsonKey(name: 'favourites_count')
  final int? favouritesCount;

  @JsonKey(name: 'is_favourited')
  final bool? isFavourited;

  @JsonKey(name: 'is_bookmarked')
  final bool? isBookmarked;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

@JsonSerializable(createToJson: false)
class Chef {
  Chef({
    required this.id,
    required this.name,
    required this.avatarPath,
    required this.isFollowing,
    required this.regionalCuisinesCount,
  });

  final int? id;
  final String? name;

  @JsonKey(name: 'avatar_path')
  final String? avatarPath;

  @JsonKey(name: 'is_following')
  final bool? isFollowing;

  @JsonKey(name: 'regional_cuisines_count')
  final int? regionalCuisinesCount;

  factory Chef.fromJson(Map<String, dynamic> json) => _$ChefFromJson(json);
}

@JsonSerializable(createToJson: false)
class Links {
  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  final String? first;
  final String? last;
  final dynamic prev;
  final dynamic next;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}

@JsonSerializable(createToJson: false)
class Meta {
  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
    required this.message,
  });

  @JsonKey(name: 'current_page')
  final int? currentPage;
  final int? from;

  @JsonKey(name: 'last_page')
  final int? lastPage;
  final List<Link>? links;
  final String? path;

  @JsonKey(name: 'per_page')
  final int? perPage;
  final int? to;
  final int? total;
  final dynamic message;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@JsonSerializable(createToJson: false)
class Link {
  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  final String? url;
  final String? label;
  final bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);
}
