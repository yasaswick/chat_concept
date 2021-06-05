import 'dart:async';

class ChatDataController<T> {
  //Chat data array
  List<T> data = [];

  //Stream controller
  final _dataFeed = StreamController<List<T>>.broadcast();

  //Exposing sink and stream of controller
  StreamSink<List<T>> get dataFeedSink => _dataFeed.sink;
  Stream<List<T>>? get dataFeedStream => _dataFeed.stream;

  //Append chats to the end of the array
  void appendData(T value) {
    data.add(value);
    _dataFeed.sink.add(data);
  }

  //Flush stream
  void flushData() {
    _dataFeed.sink.add([]);
  }

  //Dispose stream
  void dispose() {
    _dataFeed.close();
  }
}
