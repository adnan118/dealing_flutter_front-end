import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'MORE/Binding/initBinding.dart';
import 'MORE/Core/Localization/changelocal.dart';
import 'MORE/Core/Localization/languageItems/translation.dart';
import 'MORE/Core/Services/services.dart';
import 'MORE/LinksConnect/Root.dart';
import 'Views/Chat/app_service.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  await Supabase.initialize(
    url: 'https://naoavzdunhghnhnfplmm.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5hb2F2emR1bmhnaG5obmZwbG1tIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE0OTE5MTgsImV4cCI6MjA0NzA2NzkxOH0.m9Be-zq3SWCgMQ2MHX1Fv-l6Epd4sUbNo8SUFqOf92o',
  );

  Get.put<AppService>(AppService());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());

    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TitleApp'.tr,
      locale: controller.Language,
      translations: MyTranslation(),
      theme:   controller.themApp,
      initialBinding: InitBinding(),
       getPages: routes,
    );
  }
}

