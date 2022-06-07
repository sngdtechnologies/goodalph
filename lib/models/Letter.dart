// ignore_for_file: file_names

class Letter {
  final int id;
  final String picture, sound;

  Letter({
    required this.id,
    required this.picture,
    required this.sound
  });
}

// Our demo Letters

List<Letter> letters = [
  Letter(
    id: 1,
    picture: "assets/images/A.jpg",
    sound: "assets/sound/A.mp3",
  ),
  Letter(
    id: 2,
    picture: "assets/images/B.png",
    sound: "assets/sound/B.mp3",
  ),
  Letter(
    id: 3,
    picture: "assets/images/C.jpg",
    sound: "assets/sound/C.mp3",
  ),
  Letter(
    id: 4,
    picture: "assets/images/D.png",
    sound: "assets/sound/D.mp3",
  ),
  Letter(
    id: 5,
    picture: "assets/images/E.png",
    sound: "assets/sound/E.mp3",
  ),
  Letter(
    id: 6,
    picture: "assets/images/F.png",
    sound: "assets/sound/F.mp3",
  ),
  Letter(
    id: 7,
    picture: "assets/images/G.jpg",
    sound: "assets/sound/G.mp3",
  ),
  Letter(
    id: 8,
    picture: "assets/images/H.jpg",
    sound: "assets/sound/H.mp3",
  ),
  Letter(
    id: 9,
    picture: "assets/images/I.png",
    sound: "assets/sound/I.mp3",
  ),
];