import 'package:camera/camera.dart';
import 'package:eye_light/navigator/router_class.dart';
import 'package:eye_light/provider/auth_provider.dart';
import 'package:eye_light/provider/record_provider.dart';
import 'package:eye_light/resources/theme_manager.dart';
import 'package:eye_light/ui/screen/auth_screens/on_boarding_screen/on_bording_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
List<CameraDescription> cameras = [];
GetIt getIt = GetIt.instance;
initSp() async {
  getIt.registerLazySingleton<AuthProvider>(() => AuthProvider());
}
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  cameras = await availableCameras();
  initSp();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<RecordProvider>(create: (_) => RecordProvider()),
      ],
      child:const MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: RouterClass.routerClass.navKey,
            scaffoldMessengerKey:RouterClass.routerClass.rootScaffoldMessengerKey ,
            theme: getApplicationTheme(),
            home: child,
          );
        },
        child: const OnBoardingScreen()
    );
  }
}