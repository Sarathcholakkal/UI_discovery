class Article {
  final String title;
  final String image;
  final String location;
  final String author;
  final int likes;
  final int comments;
  final int shares;
  final double rating;
  bool isLiked = false;

  Article(this.title, this.image, this.comments, this.likes, this.isLiked,
      this.location, this.shares, this.author, this.rating);
}

List<Article> articles = [
  Article(
      'Japan\'s second largest metropolitan area',
      'https://images.wallpaperscraft.com/image/single/pagoda_architecture_sunlight_131905_3840x2400.jpg',
      100,
      32000,
      true,
      'Osaka Japan',
      50,
      'Hussain Mustafa',
      4),
  Article(
      'Known as the sleepless town for obvious reasons',
      'https://images.wallpaperscraft.com/image/single/road_marking_bridge_123398_1280x720.jpg',
      300,
      50000,
      true,
      'Kabuikicho Japan',
      1250,
      'Tim Salvatore',
      3),
  Article(
      'Japan\'s second largest metropolitan area',
      'https://images.wallpaperscraft.com/image/single/castle_cliff_hill_127420_1280x720.jpg',
      200,
      10000,
      true,
      'Tokyo Japan',
      1000,
      'Ely Marya',
      2.4),
];
