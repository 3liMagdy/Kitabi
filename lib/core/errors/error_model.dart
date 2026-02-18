

import 'package:kitabi/core/utils/api/end_ponits.dart';

class ErrorModel {
  final int states;
  final String errmessage;

  ErrorModel({required this.states, required this.errmessage});

  factory ErrorModel.fromjson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      states: jsonData[ApiKey.status],
      errmessage: jsonData[ApiKey.errorMessage],
    );
  }
}
