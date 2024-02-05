class HomeStoryModel {
  final String title;
  final String image;
  final List<String> stories;

  HomeStoryModel({required this.image, required this.title, required this.stories});

  factory HomeStoryModel.fromJson(Map<String, dynamic> snapshot) {
    return HomeStoryModel(
      title: snapshot['title'],
      stories: (snapshot['stories'] as List<dynamic>).map((dynamic item) => item.toString()).toList(),
      image: snapshot['image'],
    );
  }
}
