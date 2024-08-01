import 'dart:isolate';

import 'package:dio/dio.dart';

class TaskService {
  static void calculate(SendPort sendPort) async {
    int sum = 0;
    for (var i = 0; i < 4000000000; i++) {
      sum += i;
    }
    sendPort.send(sum);
  }

  static void downloadVideo(SendPort sendPort) async {
    const url =
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4";
    final dio = Dio();

    final response = await dio.get(url, onReceiveProgress: (count, total) {
      sendPort.send(count / total * 100);
    });

    
  }
}
