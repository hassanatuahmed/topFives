// TODO Implement this library.

 class OnBoard{
  final String title;
  final String image;
  final String description;

  OnBoard({required this.title,required this.description,required this.image});
}

final List<OnBoard> demoData = [
 OnBoard(
  image: "assets/images/Rectangle1.png",
  title: "Welcome to TopFives",
  description:
  "The app that allows you to rank your top 5 in any category. Share, comment and compare. Don’t forget to invite friends!!",
 ),
 OnBoard(
  image: "assets/images/Rectangle2.png",
  title: "Engage with others",
  description:
  "Discover and explore the rankings of fellow users. Like, comment, and share your thoughts to spark conversations and build connections. Uncover hidden gems and broaden your horizons.",
 ),
 OnBoard(
  image: "assets/images/Rectangle3.png",
  title: "Discover the Trending Rankings",
  description:
  "Stay up to date with the latest trends and popular rankings. See what's capturing the attention of users worldwide. Don't miss out on the next big thing!",
 ),

];
