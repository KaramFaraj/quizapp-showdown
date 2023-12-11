// import 'package:quiz_showdown/main.dart';
// import 'package:flutter/material.dart';
// import 'package:quiz_showdown/model/base/answer_model.dart';
// import 'package:quiz_showdown/model/request/create_question_model.dart';
// import 'package:quiz_showdown/service/question_service.dart';

// mixin UtilityComponent {
//   checkoutAnswer(
//       bool isCorrect, BuildContext context, num time, num answerTime) {
//     if (time < answerTime) {
//       ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
//         duration: Duration(seconds: 1),
//         content: Text('Time Out'),
//         backgroundColor: Colors.blue,
//       ));
//     } else {
//       if (isCorrect) {
//         ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
//           duration: Duration(seconds: 1),
//           content: Text('Success'),
//           backgroundColor: Colors.green,
//         ));

//         correctAnswer++;
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
//           duration: Duration(seconds: 1),
//           content: Text('Failed'),
//           backgroundColor: Colors.red,
//         ));

//         wrongAnswer++;
//       }
//     }
//   }
// }
