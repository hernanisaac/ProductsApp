// To parse this JSON data, do
//
//     final statusModel = statusModelFromMap(jsonString);

import 'dart:convert';


class ResultsModel {
  ResultsModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  Map<String,dynamic> origin;
  Map<String,dynamic> location;
  String image;
  List<dynamic> episode;
  String url;
  DateTime created;

  factory ResultsModel.fromJson(String str) => ResultsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResultsModel.fromMap(Map<String, dynamic> json) => ResultsModel(
      id:json['id'],
      name:json['name'],
      status:json['status'],
      species:json['species'],
      type:json['type'],
      gender:json['gender'],
      origin:json['origin'],
      location:json['location'],
      image:json['image'],
      episode:json['episode'],
      url:json['url'],
      created:DateTime.parse(json['created']) ,
  );

  Map<String, dynamic> toMap() => {
    "id":id,
    "name":name,
    "status":status,
    "species":species,
    "type":type,
    "gender":gender,
    "origin":origin,
    "location":location,
    "image":image,
    "episode":episode,
    "url":url,
    "created":created,
  };
}
