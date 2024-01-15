import 'package:aladin/constants/color.dart';
import 'package:aladin/modules/splash/splash_screen.dart';
import 'package:aladin/states/bindings/bindings.dart';
import 'package:aladin/states/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase/firebase_api.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      "pk_test_51O0MBoCi9Y8b5iuz1WMKjERBoYrvGbFGsAWDVO21TMsPYzQLls3NoQr80q9RUZD88gRhw6QIYwAnoCMwabuBJY4P00umdr0Cfo";

  await GetStorage.init();
  //Load our .env file that contains our Stripe Secret key
  Stripe.merchantIdentifier = 'haza';
  await Stripe.instance.applySettings();
  await dotenv.load(fileName: "assets/.env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAPI().initNotifications();
  runApp(const MyApp());
  // Add this code below
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Haza Deals',
            theme: ThemeData(
              primarySwatch: Colors.orange,
              inputDecorationTheme: InputDecorationTheme(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ConstantColors.darkYellow),
                ),
              ),

              /* textTheme:Theme.of(context).textTheme.apply(
                 bodyColor: Colors.orange,
                // displayColor: Colors.orange,
               ),*/
            ),
            getPages: AllRoutes.allRoutes,
            initialRoute: SplashScreen.routeName,
            initialBinding: InitialBinding(),
          );
        });
  }
}
