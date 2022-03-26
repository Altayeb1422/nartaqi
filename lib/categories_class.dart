class Categories {
  final String catName, cover;


  Categories(  {
    required this.cover,
    required this.catName,
  });
}

List<Categories> categories = [

  Categories(cover: 'images/Englishbooks.jpg', catName: 'الكتب الإنجليزية'),
  Categories(cover: 'images/children.jpg', catName: 'قسم الأطفال'),
  Categories(cover: 'images/translated.jpg', catName: 'الكتب المترجمة'),
  Categories(cover: 'images/sudanese.jpg', catName: 'الكتب السودانية'),
  Categories(cover: 'images/classics.jpg', catName: 'كلاسيكيات'),
  Categories(cover: 'images/arabic.jpg', catName: 'الكتب العربية'),
  Categories(cover: 'images/pocket.jpg', catName: 'كتب الجيب'),

];