import 'dart:async';

class StreamControllerHelper{

  static var shared = StreamControllerHelper();

  StreamController<int> _controller = StreamController<int>.broadcast();

  Stream<int> get stream => _controller.stream;
  StreamSink<int> get sink => _controller.sink;

  closeStream(){
    _controller.close();
  }

  setLastIndex(int index){
    sink.add(index);
  }

}