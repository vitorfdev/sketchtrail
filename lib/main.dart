import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sketchtrail/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sketchtrail',
      theme: ThemeData(
        textTheme: GoogleFonts.patrickHandTextTheme(
          Theme.of(context).textTheme,
        )
      ),
      home: const HomePage(),
    );
  }
}