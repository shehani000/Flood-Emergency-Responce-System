import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor:
              Colors.white, // Set the background color of the app bar to white
        ),
      ),
      home: const FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isTablet = mediaQuery.size.width > 600;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove the back button
        title: Image.asset(
          "assets/logo.png",
          width: isTablet ? 120 : 80, // Adjust the image width for tablets
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(isTablet ? 32.0 : 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 30),
            Image.asset(
              'assets/sri lanka.png',
              width: double.infinity,
              height: mediaQuery.size.height * 0.3,
            ),
            const SizedBox(height: 25),
            Text(
              'FLOOD EMERGENCY \nRESPONSE SYSTEM',
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize:
                    isTablet ? 40 : 30, // Adjust the font size for tablets
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Text(
              'RATHNAPURA|SRI LANKA',
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize:
                    isTablet ? 20 : 16, // Adjust the font size for tablets
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: mediaQuery.size.width *
                  (isTablet ? 0.4 : 0.6), // Adjust the width as needed
              child: ElevatedButton(
                onPressed: () {
                  const url =
                      'https://fers.crd.lk/Home/Register'; // Replace with the desired URL
                  // ignore: deprecated_member_use
                  launch(url);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: const Color(0xff006aff),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text(
                  'Register',
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize:
                        isTablet ? 20 : 18, // Adjust the font size for tablets
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: mediaQuery.size.width *
                  (isTablet ? 0.4 : 0.6), // Adjust the width as needed
              child: ElevatedButton(
                onPressed: () {
                  const url =
                      'https://fers.crd.lk/Dashboard/Main_Dashboard'; // Replace with the desired URL
                  // ignore: deprecated_member_use
                  launch(url);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: const Color(0xff006aff),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text(
                  'Mobile Dashboard',
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize:
                        isTablet ? 20 : 18, // Adjust the font size for tablets
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: mediaQuery.size.width *
                  (isTablet ? 0.4 : 0.6), // Adjust the width as needed
              child: ElevatedButton(
                onPressed: () {
                  const url =
                      'https://gis.crd.lk/portal/sharing/oauth2/authorize?client_id=dashboards&response_type=token&state=%7B%22portalUrl%22%3A%22https%3A%2F%2Fgis.crd.lk%2Fportal%22%7D&expiration=20160&locale=en&redirect_uri=https%3A%2F%2Fgis.crd.lk%2Fportal%2Fapps%2Fdashboards%2Fb4050a27e5854367830f65fc83d9fc17&redirectToUserOrgUrl=true'; // Replace with the desired URL
                  // ignore: deprecated_member_use
                  launch(url);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: const Color(0xff006aff),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text(
                  'GIS Dashboard',
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize:
                        isTablet ? 20 : 18, // Adjust the font size for tablets
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
