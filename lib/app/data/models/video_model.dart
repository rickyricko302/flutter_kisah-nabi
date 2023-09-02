class VideoModel {
  String? url, title, desc, channelName, channelThumb, channelUrl;
  VideoModel({required this.url, required this.title, required this.desc});

  VideoModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    title = json['title'];
    desc = json['desc'];
    channelName = json['channel_name'];
    channelThumb = json['channel_thumb'];
    channelUrl = json['channel_url'];
  }
}
