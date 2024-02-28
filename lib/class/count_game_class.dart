class CountGame {
  final int numberOfItems;
  final String imagePath;
  final String title;
  final int correctAnswer;
  final int wrongAnswer1;
  final int wrongAnswer2;
  final int wrongAnswer3;

  CountGame(
    this.numberOfItems,
    this.imagePath,
    this.title,
    this.correctAnswer,
    this.wrongAnswer1,
    this.wrongAnswer2,
    this.wrongAnswer3,
  );
  
  // list of count game items for the level 1, 1-10
  static List<CountGame> getCountGameLevel1() {
    return <CountGame>[
      CountGame(1, 'assets/images/lion_face.png', 'Lions', 1, 2, 3, 4),
      CountGame(4, 'assets/images/lion_face.png', 'Lions', 4, 5, 6, 7),
      CountGame(2, 'assets/images/lion_face.png', 'Lions', 2, 3, 4, 5),
      CountGame(3, 'assets/images/lion_face.png', 'Lions', 3, 4, 5, 6),
      CountGame(5, 'assets/images/lion_face.png', 'Lions', 5, 6, 7, 8),
    ];
  }

  // level 2: 5-10
  static List<CountGame> getCountGameLevel2() {
    return <CountGame>[
      CountGame(6, 'assets/images/bird.png', 'Birds', 6, 7, 8, 9),
      CountGame(7, 'assets/images/bird.png', 'Birds', 7, 8, 9, 10),
      CountGame(8, 'assets/images/bird.png', 'Birds', 8, 9, 10, 11),
      CountGame(9, 'assets/images/bird.png', 'Birds', 9, 10, 11, 12),
      CountGame(10, 'assets/images/bird.png', 'Birds', 10, 11, 12, 13),
    ];
  }

  //level 3: 10-15 with cat.png image
  static List<CountGame> getCountGameLevel3() {
    return <CountGame>[
      CountGame(11, 'assets/images/cat.png', 'Cats', 11, 12, 13, 14),
      CountGame(12, 'assets/images/cat.png', 'Cats', 12, 13, 14, 15),
      CountGame(13, 'assets/images/cat.png', 'Cats', 13, 14, 15, 16),
      CountGame(14, 'assets/images/cat.png', 'Cats', 14, 15, 16, 17),
      CountGame(15, 'assets/images/cat.png', 'Cats', 15, 16, 17, 18),
    ];
  }

  // level 4: 15-20 with rabbit.png image
  static List<CountGame> getCountGameLevel4() {
    return <CountGame>[
      CountGame(16, 'assets/images/rabbit.png', 'Rabbits', 16, 17, 18, 19),
      CountGame(17, 'assets/images/rabbit.png', 'Rabbits', 17, 18, 19, 20),
      CountGame(18, 'assets/images/rabbit.png', 'Rabbits', 18, 19, 20, 21),
      CountGame(19, 'assets/images/rabbit.png', 'Rabbits', 19, 20, 21, 22),
      CountGame(20, 'assets/images/rabbit.png', 'Rabbits', 20, 21, 22, 23),
    ];
  }
}
