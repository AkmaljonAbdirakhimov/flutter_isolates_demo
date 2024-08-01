import 'dart:isolate';

import 'package:dio/dio.dart';

import '../services/task_service.dart';

class Calculator {
  void addWithoutIsolage() {
    int sum = 0;
    for (var i = 0; i < 4000000000; i++) {
      sum += i;
    }

    print(sum);
  }

  void addWithIsolate() {
    final receivePort = ReceivePort();

    Isolate.spawn(TaskService.calculate, receivePort.sendPort);

    receivePort.listen((message) {
      print(message);

      receivePort.close();
    });
  }

  void downloadVideoWithoutIsolate() async {
    const url =
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4";
    final dio = Dio();

    final response = await dio.get(url, onReceiveProgress: (count, total) {
      print(count / total * 100);
    });
  }

  void downloadVideoWithIsolate() async {
    final receivePort = ReceivePort();

    Isolate.spawn(TaskService.downloadVideo, receivePort.sendPort);

    receivePort.listen(
      (message) {
        print(message);
      },
    );
  }
}
