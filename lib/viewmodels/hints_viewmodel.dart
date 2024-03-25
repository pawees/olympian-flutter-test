import 'package:flutter/material.dart';
import '../models/hint_model.dart';
import '../services/db_service.dart';


class HintsViewModel with ChangeNotifier {
  HintsViewModel() : _db = DbService() {
    init();
  }

  final DbService _db;
  late Map<String, HintModel> _hints;
  Map<String, HintModel> get hints => _hints;

  init() {
    _hints = {
      'animation1': HintModel(
        state: _getHintState('animation1'),
      ),
      //'animation2': HintModel(),
      //...
    };
  }

  HintState _getHintState(key) {
    if (_db.getAnimationState(key)) {
      return HintState.hidden;
    } else {
      return HintState.visible;
    }
  }


  void setHidden(String key) {
    _db.setAnimationState(key);
    _hints[key]?.makeHidden();
    notifyListeners();
  }
}
