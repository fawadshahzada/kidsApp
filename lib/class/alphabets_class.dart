class Alphabets {
  final String alphabet;
  final String forwardAlphabet;
  final String audioPath;
  // final String imagePath;
  final Function onPressed;

  Alphabets(
      {required this.alphabet,
      required this.audioPath,
      // required this.imagePath,
      required this.forwardAlphabet,
      required this.onPressed});

  // static List<Alphabets> getAlphabets() {}

  static List<Alphabets> getAlphabets() {
    return <Alphabets>[
      Alphabets(
        alphabet: 'A',
        audioPath: 'voice/alphabets/a_voice.mp3',
        forwardAlphabet: 'Apple',
        onPressed: () {},
      ),
      Alphabets(
        alphabet: 'B',
        audioPath: 'voice/alphabets/b_voice.mp3',
        forwardAlphabet: 'Ball',
        onPressed: () {},
      ),
      Alphabets(
        alphabet: 'C',
        audioPath: 'voice/alphabets/c_voice.mp3',
        forwardAlphabet: 'Cat',
        onPressed: () {},
      ),
      Alphabets(
        alphabet: 'D',
        audioPath: 'voice/alphabets/d_voice.mp3',
        forwardAlphabet: 'Dog',
        onPressed: () {},
      ),
      Alphabets(
        alphabet: 'E',
        audioPath: 'voice/alphabets/e_voice.mp3',
        forwardAlphabet: 'Elephant',
        onPressed: () {},
      ),
      Alphabets(
        alphabet: 'F',
        audioPath: 'voice/alphabets/f_voice.mp3',
        forwardAlphabet: 'Fish',
        onPressed: () {},
      ),
      Alphabets(
        alphabet: 'G',
        audioPath: 'voice/alphabets/g_voice.mp3',
        forwardAlphabet: 'Goat',
        onPressed: () {},
      ),
      Alphabets(
        alphabet: 'H',
        audioPath: 'voice/alphabets/h_voice.mp3',
        forwardAlphabet: 'Horse',
        onPressed: () {},
      ),
      Alphabets(
        alphabet: 'I',
        audioPath: 'voice/alphabets/i_voice.mp3',
        forwardAlphabet: 'Ice Cream',
        onPressed: () {},
      ),
      Alphabets(
        alphabet: 'J',
        audioPath: 'voice/alphabets/j_voice.mp3',
        forwardAlphabet: 'Jug',
        onPressed: () {},
      ),
      Alphabets(
        alphabet: 'K',
        audioPath: 'voice/alphabets/k_voice.mp3',
        forwardAlphabet: 'Kite',
        onPressed: () {},
      ),
      Alphabets(
        alphabet: 'L',
        audioPath: 'voice/alphabets/l_voice.mp3',
        forwardAlphabet: 'Lion',
        onPressed: () {},
      ),
      Alphabets(
        alphabet: 'M',
        audioPath: 'voice/alphabets/m_voice.mp3',
        forwardAlphabet: 'Monkey',
        onPressed: () {},
      ),
      Alphabets(
        alphabet: 'N',
        audioPath: 'voice/alphabets/n_voice.mp3',
        forwardAlphabet: 'Nest',
        onPressed: () {},
      ),
      Alphabets(
        alphabet: 'O',
        audioPath: 'voice/alphabets/o_voice.mp3',
        forwardAlphabet: 'Owl',
        onPressed: () {},
      ),
      Alphabets(
        alphabet: 'P',
        audioPath: 'voice/alphabets/p_voice.mp3',
        forwardAlphabet: 'Parrot',
        onPressed: () {},
      ),
      Alphabets(
        alphabet: 'Q',
        audioPath: 'voice/alphabets/q_voice.mp3',
        forwardAlphabet: 'Queen',
        onPressed: () {},
      ),
      Alphabets(
        alphabet: 'R',
        audioPath: 'voice/alphabets/r_voice.mp3',
        forwardAlphabet: 'Rabbit',
        onPressed: () {},
      ),
      Alphabets(
        alphabet: 'S',
        audioPath: 'voice/alphabets/s_voice.mp3',
        forwardAlphabet: 'Sun',
        onPressed: () {},
      ),
      Alphabets(
        alphabet: 'T',
        audioPath: 'voice/alphabets/t_voice.mp3',
        forwardAlphabet: 'Tree',
        onPressed: () {},
      ),
      Alphabets(
        alphabet: 'U',
        audioPath: 'voice/alphabets/u_voice.mp3',
        forwardAlphabet: 'Umbrella',
        onPressed: () {},
      ),
      Alphabets(
        alphabet: 'V',
        audioPath: 'voice/alphabets/v_voice.mp3',
        forwardAlphabet: 'Van',
        onPressed: () {},
      ),
      Alphabets(
        alphabet: 'W',
        audioPath: 'voice/alphabets/w_voice.mp3',
        forwardAlphabet: 'Watch',
        onPressed: () {},
      ),
      Alphabets(
        alphabet: 'X',
        audioPath: 'voice/alphabets/x_voice.mp3',
        forwardAlphabet: 'Xylophone',
        onPressed: () {},
      ),
      Alphabets(
        alphabet: 'Y',
        audioPath: 'voice/alphabets/y_voice.mp3',
        forwardAlphabet: 'Yak',
        onPressed: () {},
      ),
      Alphabets(
        alphabet: 'Z',
        audioPath: 'voice/alphabets/z_voice.mp3',
        forwardAlphabet: 'Zebra',
        onPressed: () {},
      ),
    ];
  }
}
