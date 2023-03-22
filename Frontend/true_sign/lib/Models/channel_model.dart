import 'package:flutter/foundation.dart';
import 'package:true_sign/Models/video_model.dart';

class Channel{
  late final String id;
  final String title;
  final String profilePictureUrl;
  final String SubscriberCount;
  final String videoCount;
  List<Video>? videos;

  Channel({
    required this.id,
    required this.title,
    required this.profilePictureUrl,
    required this.SubscriberCount,
    required this.videoCount,
    this.videos

});

  factory Channel.fromMap(Map<String, dynamic>map){
    return Channel(
        id: map['id'],
        title: map['snippet']['title'],
        profilePictureUrl: map['snippet']['thumbnails']['default']['url'],
        SubscriberCount: map['statistics']['subscriberCount'],
        videoCount: map['statistics']['videoCount'],
        );
  }
}
