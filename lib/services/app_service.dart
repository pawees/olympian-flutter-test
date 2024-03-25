import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'db_service.dart';




class AppService {
  final DbService _db = DbService();


  static final BehaviorSubject<bool> _isFirstLaunchSubject = BehaviorSubject<bool>();

  static Stream<bool> get isFirstLaunchStream => _isFirstLaunchSubject.stream;

   init() async {
     if (!_db.firstTimeSession()) {
      AppService._isFirstLaunchSubject.sink.add(true);
    } else {
       AppService._isFirstLaunchSubject.sink.add(false);
     }

  }
}
