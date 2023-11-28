import 'package:dio/dio.dart';

abstract class QuizService {
  Dio dio = Dio();
  String baseUrl = 'https://653e6cc99e8bd3be29df4853.mockapi.io/question';
  getQuizCard();
}

class QuizServiceImp extends QuizService {
  @override
  getQuizCard() async {
    // try {
      Response response = await dio.get(baseUrl);
    if(response.statusCode==200){
     print(response.data);
      return response.data;
    }
    // } catch (e) {
    //   throw (e);
    // }
  }
}
 