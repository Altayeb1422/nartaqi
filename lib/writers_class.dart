class Writer {
  final String name;
  final String iconimage;
  final String description;
  final String book1;
  final String? book2;
  final String  cv;
  final int position;

  Writer({required this.book1,
    this.book2,
    required this.description,
    required this.name,
    required this.iconimage,
    required this.position,
    required  this.cv,
  });
}

List<Writer> writer = [
  Writer(
    description: 'description',
    name: "محمد الطيب",
    iconimage: 'images/mohamed.jpg',
    book1:'images/gaber.jpg',
    position: 1,
    cv: 'روائي'

  ,),
  Writer(
    description: 'description',
    name: "صلاح التنقاري",
    iconimage: 'images/salah.jpg',
    book1: 'images/goba.jpg',
    position: 2,
    cv: 'قاص وروائي'
  ,),

  Writer(
    description: 'عمرو إبراهيم مصطفي',
    name: "عمرو إبراهيم",
    iconimage: 'images/Amro.jpg',
    book1: 'images/sirat.jpg',
    position: 4,
    cv: 'روائي'
  ,),
  Writer(
    description: 'description',
    name: "صديق الحلو",
    iconimage: 'images/sidig_elhlew.jpg',
    book1: 'images/goba.jpg',
    position: 2,
    cv: 'قاص وروائي'
    ,),
  Writer(
    description: 'description',
    name: "علي عثمان الإمام",
    iconimage: 'images/Ali.jpg',
    book1: 'images/messages.jpg',
    position: 5,
    cv: 'كاتب'
  ,),
  Writer(
    description: 'description',
    name: "أبرار الطيب",
    iconimage: 'images/Abrar_icon.jpg',
    book1: 'images/abrar.jpg',
    position: 6,
    cv: 'شاعرة وروائية'
  ,),
  Writer(
    description: 'description',
    name: "إبتهال أزهري",
    iconimage: 'images/ebthal.jpg',
    book1: 'images/idiology.jpg',
    position: 7,
    cv: 'شاعرة وباحثة'
  ,),
  Writer(
    description: 'description',
    name: "الطيب قرشي",
    iconimage: 'images/qurashi.jpg',
    book1: 'images/angle.jpg',
    position: 8,
    cv: 'قاص'
  ,),
  Writer(
    description: 'description',
    name: "ريل إبراهيم",
    iconimage: 'images/salah.jpg',
    book1: 'images/gofran.jpg',
    position: 9,
      cv: 'شاعرة وروائية'
   ,),
  Writer(
    description: 'description',
    name: "عبدالله كمال",
    iconimage: 'images/Abdullah_kamal.jpg',
    book1: 'images/gofran.jpg',
    position: 9,
    cv: 'روائي'
    ,),
  Writer(
    description: 'description',
    name: "عاطف الحاج",
    iconimage: 'images/Atif_Elhaj.jpg',
    book1: 'images/gofran.jpg',
    position: 9,
    cv: 'روائي'
    ,),
  Writer(
    description: 'description',
    name: "ياسين حسن",
    iconimage: 'images/yassin.jpg',
    book1: 'images/bullet.jpg',
    position: 10,
      cv: 'روائي'
  ,),
  Writer(
      description: '',
      name: "أحمد طارق",
      iconimage: 'images/ahmed.jpg',
      book1: 'images/tarig.jpg',
      position: 11,
      cv: 'روائي وقاص'
  ,),

  Writer(
      description: '',
      name: "عثمان الشيخ",
      iconimage: 'images/osman.jpg',
      book1: 'images/tlsos.jpg',
      position: 11,
      cv: 'شاعر وقاص'
  ,),

  Writer(
    description: 'من مواليد ام درمان ولد في اكتوبر ١٩٤٢م  نشاء وترعرع في ودنباوي التحق بدراسة القران الكريم في خلاوي مسجد الخرطوم العتيق بالسوق العربي، درس الابتدائية بمدرسة الخرطوم شرق الاولية، ثم الوسطي بالخرطوم الاهلية الوسطي. انتقل الي عطبرة لدراسة المرحلة الثانوية بمدرسة عطبرة الثانوية الحكومية ثم عاد واكمل دراسته في مدرسة الخرطوم الثانوية. التحق بالقوات المسلحة وعمل في مناطق مختلفة بالسودان بحسب مقتضيات الوظيفة. تركت فترة الطفولة في سوق العناقريب بالسوق العربي في نفسه ذكريات لاتزال مصدر السعادة والالق والزمن الجميل وللقصة بقية.',
    name: "سراج الدين محمد",
    iconimage: 'images/siraj.jpg',
    book1: 'images/souq.jpg',
    position: 12,
    cv: 'كاتب وشاعر'
  ,),
  Writer(
    description: 'description',
    iconimage: 'images/alaa.jpg',
    name: 'الآء السر سعد',
    book1: 'images/coffee.jpg',
    position: 13,
    cv: 'روائية'
  ,),

  Writer(
    description: 'description',
    iconimage: 'images/sara.jpg',
    name: 'سارة شرف الدين',
    book1: 'images/gineeiah.jpg',
    position: 14,
      cv: 'روائية'
  ,),
];
