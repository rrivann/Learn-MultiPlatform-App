import 'data/multimedia.dart';

void main(List<String> args) {
  var video = Video();
  video.name = 'learn dart';
  print(video.name);
  video.play();
  video.stop();
}
