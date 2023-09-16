import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import '../utils/global_hive.dart';


class AppStartupConfiguration {
  static doConfigurations() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDirectory.path);
    ErrorWidget.builder = (FlutterErrorDetails details) => Container(
          color: Colors.white
        );

 if (!Hive.isBoxOpen("appBox")) {
      preferences = await Hive.openBox('appBox');
      preferences.put("countLength", "0");
    }

     
    
    }
}
