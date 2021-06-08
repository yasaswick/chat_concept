import 'package:timeago/timeago.dart' as timeago;

//Time ago
String getTimeAgo(String eptime) {
  var time =
      DateTime.fromMillisecondsSinceEpoch(double.parse(eptime).toInt() * 1000);
  return timeago.format(time);
}
