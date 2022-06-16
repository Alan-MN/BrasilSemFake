import 'package:dio/dio.dart';
import 'message.dart';
import 'answer.dart';

class DioClient {
  final Dio _dio = Dio();
  final _baseUrl = 'https://bsf-chatbot.herokuapp.com';

  Future<Answer?> sendMessageToBot({required Message message}) async {
    Answer? botAnswer;

    try {
      Response response = await _dio.post(
        _baseUrl + '/chatbot/send-message',
        data: message.toJson(),
      );

      print('message sent: ${response.data}');

      botAnswer = Answer(text: response.data['botResponse']);
    } catch (e) {
      print('Error sending message: $e');
    }

    return botAnswer;
  }
}
