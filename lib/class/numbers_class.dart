class Numbers{
  final String number;
  final String numberInWords;
  final String audioPath;

  Numbers(
      {required this.number,
      required this.audioPath,
      required this.numberInWords,
      });
  static List<Numbers> getNumbers() {
    return <Numbers>[
      Numbers(
        number: '0',
        audioPath: 'voice/numbers/0.mp3',
        numberInWords: 'Zero',
      ),
      Numbers(
        number: '1',
        audioPath: 'voice/numbers/1.mp3',
        numberInWords: 'One',
      ),
      Numbers(
        number: '2',
        audioPath: 'voice/numbers/2.mp3',
        numberInWords: 'Two',
      ),
      Numbers(
        number: '3',
        audioPath: 'voice/numbers/3.mp3',
        numberInWords: 'Three',
      ),
      Numbers(
        number: '4',
        audioPath: 'voice/numbers/4.mp3',
        numberInWords: 'Four',
      ),
      Numbers(
        number: '5',
        audioPath: 'voice/numbers/5.mp3',
        numberInWords: 'Five',
      ),
      Numbers(
        number: '6',
        audioPath: 'voice/numbers/6.mp3',
        numberInWords: 'Six',
      ),
      Numbers(
        number: '7',
        audioPath: 'voice/numbers/7.mp3',
        numberInWords: 'Seven',
      ),
      Numbers(
        number: '8',
        audioPath: 'voice/numbers/8.mp3',
        numberInWords: 'Eight',
      ),
      Numbers(
        number: '9',
        audioPath: 'voice/numbers/9.mp3',
        numberInWords: 'Nine',
      ),
    ];
  }
}