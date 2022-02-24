import '../model/category_menu_model.dart';

List<HeaderMenu> headerMenu() {
  List<HeaderMenu> myCategory = [];
  HeaderMenu abc;
  //1
  abc = HeaderMenu();
  abc.title = "General";
  abc.imagePath = "assets/Images/daytodaylife.jpg";
  myCategory.add(abc);
  //2
  abc = HeaderMenu();
  abc.title = "Entertainment";
  abc.imagePath = "assets/Images/entertainment.jpg";
  myCategory.add(abc);
  //3
  abc = HeaderMenu();
  abc.title = "Technology";
  abc.imagePath = "assets/Images/technology.jpg";
  myCategory.add(abc);
  //4
  abc = HeaderMenu();
  abc.title = "Sports";
  abc.imagePath = "assets/Images/sports.jpg";
  myCategory.add(abc);
  //5
  abc = HeaderMenu();
  abc.title = "Business";
  abc.imagePath = "assets/Images/businessnews_icon.jpg";
  myCategory.add(abc);
  //6
  abc = HeaderMenu();
  abc.title = "Health";
  abc.imagePath = "assets/Images/health.jpg";
  myCategory.add(abc);
  //7
  abc = HeaderMenu();
  abc.title = "Science";
  abc.imagePath = "assets/Images/science.jpg";
  myCategory.add(abc);

  return myCategory;
}
