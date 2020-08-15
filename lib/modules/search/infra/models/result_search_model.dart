import 'dart:convert';

import 'package:myFirst/modules/search/domain/entities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  final String login;
  final String type;
  final String avatar_url;

  ResultSearchModel({this.login, this.type, this.avatar_url});

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'type': type,
      'avatar_url': avatar_url,
    };
  }

  static ResultSearchModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ResultSearchModel(
      login: map['login'],
      type: map['type'],
      avatar_url: map['avatar_url'],
    );
  }

  String toJson() => json.encode(toMap());

  static ResultSearchModel fromJson(String source) =>
      fromMap(json.decode(source));
}
