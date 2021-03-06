import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'package:mobile_weather_app/ui/home.dart';
import 'package:mobile_weather_app/ui/weekly_forecast.dart';
import 'package:mobile_weather_app/ui/city_search.dart';
import 'package:mobile_weather_app/ui/settings.dart';
import 'package:mobile_weather_app/data/settings.dart';
import 'package:mobile_weather_app/data/weather.dart';
import 'package:mobile_weather_app/ui/about.dart';
import 'package:mobile_weather_app/ui/favorites.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  await SettingsModel.initPrefs();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<WeatherModel>(create: (context) => WeatherModel()),
      ChangeNotifierProvider<SettingsModel>(create: (context) => SettingsModel()),
    ],
    child: const EotsApp(),
  ));
}

class EotsApp extends StatelessWidget {
  const EotsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const lightPrimary = Color(0xffe2ebff);
    const darkPrimary = Color(0xff0c1620);

    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      theme: const NeumorphicThemeData(
        baseColor: lightPrimary,
        variantColor: Color(0xffe1e9ff),
        accentColor: Color(0xff4b5f88),
        appBarTheme: NeumorphicAppBarThemeData(
          color: lightPrimary,
        ),
        textTheme: TextTheme(
          subtitle1: TextStyle(color: Color(0xff656565)),
          subtitle2: TextStyle(color: Colors.white),
        ),
      ),
      darkTheme: const NeumorphicThemeData(
        baseColor: darkPrimary,
        variantColor: Color(0xff0d172b),
        accentColor: Color(0xff0a1121),
        shadowLightColor: Color(0xFF828282),
        defaultTextColor: Colors.white,
        textTheme: TextTheme(
          subtitle1: TextStyle(color: Color(0xffe5e5e5)),
          subtitle2: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      materialTheme: ThemeData(
        scaffoldBackgroundColor: lightPrimary,
        backgroundColor: lightPrimary,
        cardColor: lightPrimary,
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: lightPrimary,
        ),
      ),
      materialDarkTheme: ThemeData(
        scaffoldBackgroundColor: darkPrimary,
        primaryColor: Colors.white,
        backgroundColor: darkPrimary,
        cardColor: darkPrimary,
        brightness: Brightness.dark,
        cardTheme: const CardTheme(
          shadowColor: Colors.white,
        ),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
        ),
      ),
      title: 'Weather',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/week': (context) => const WeeklyForecastPage(),
        '/cities': (context) => const CitySearchPage(),
        '/favorites': (context) => const FavoritesPage(),
        '/settings': (context) => const SettingsPage(),
        '/about': (context) => const AboutPage(),
      },
    );
  }
}
