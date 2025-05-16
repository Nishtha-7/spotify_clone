import 'song.dart';

class Album {
  final String title;
  final String coverImagePath;
  final List<Song> songs;

  Album({
    required this.title,
    required this.coverImagePath,
    required this.songs,
  });
}
