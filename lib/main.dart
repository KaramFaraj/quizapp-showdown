import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_showdown/model/response/question_model.dart';
import 'package:quiz_showdown/service/question_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}




class _QuizPageState extends State<QuizPage> {
  late List<QuestionModel> question = [];
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: question.length,
        controller: controller,
        itemBuilder: (context, pageindex) => FutureBuilder(
          future: QuestionServiceImp().getAllQuestion(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              dynamic temp = snapshot.data;
              List<QuestionModel> data = temp as List<QuestionModel>;
              print('1');
              print(temp);
              if (temp.isEmpty) {
                print('2');
                print(temp);
                return Center(
                  child: Text('Empty'),
                );
              } else {
                print('3');
                print(temp);
                return PageView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) => Scaffold(
                    body: Column(
                      children: [
                        Text(data[index].question),
                        SizedBox(
                          height: 500,
                          child: ListView.separated(
                              itemBuilder: (context, ind) => ListTile(
                                    onTap: () {},
                                    title:
                                        Text(data[index].answers[ind].answer),
                                  ),
                              separatorBuilder: (context, index) => Divider(),
                              itemCount: data[index].answers.length),
                        )
                      ],
                    ),
                  ),
                );
              }
            } else {
              print(snapshot.error);
              return LinearProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////

// int currentIndex = 0;
// Timer? timer;
// Duration timeLeft = const Duration(seconds: 10);
// int score = 0;

// @override
// void initState() {
//   super.initState();
//   startTimer();
// }

// @override
// void dispose() {
//   timer?.cancel();
//   super.dispose();
// }

// void startTimer() {
//   timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//     setState(() {
//       timeLeft -= const Duration(seconds: 1);
//       if (timeLeft.isNegative) {
//         timeLeft = const Duration(seconds: 0);
//         timer.cancel();
//         // handle answer timeout
//         // decrement score
//         score--;
//       }
//     });
//   });
// }
