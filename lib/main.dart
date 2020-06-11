import './providers/MenuProvider.dart';
import './shared/colors.dart';

import './screens/ListMenuDetail.dart';

import './screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'screens/cartPage.dart';
import 'screens/listMenu.dart';
// import 'package:google_fonts/google_fonts.dart';

import 'providers/CartProvider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
    SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white, // navigation bar color
    statusBarColor: CustomColors.orange, // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProvider.value(value: MenuProvider()),
        ChangeNotifierProvider.value(value: ListMenuProvider()),
      ],
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'W Food',
        theme: ThemeData(
          primaryColor: Colors.white,
          // textTheme: GoogleFonts.robotoCondensedTextTheme(
          //   Theme.of(context).textTheme,
          // ),
        ),
       // home: HomeScreen(),
       home: MenuScreen(),
        routes: {
          'listMenuDetail':(context)=>MenuListDetail(),
          'cartPage':(context)=>CartPage(),
          'listMenu':(context)=>ListMenuScreen()
        },
        
      ),
    );
  }
}



