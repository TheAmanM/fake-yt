import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

bool darkModeOn = false;
String keyWord = 'light';
int delay = 0;
List<String> errors = [
  "There was a problem with the SHA1 certificate of authentication from api.google.com/youtube. Contact a support person or your service provider.\n\nLast API call: $delay seconds ago.\nError Code: 80072F0D",
  "The {this.getMinimumSDKVersion().toInt()} call was not found in the target object store. \n\nThe API call accepts the symbolic name, but the value that was sent from the server to the client does not resolve to a valid property template in the target object store model. \n\nPlease ensure that the symbolic name of the property template that is sent in the URI exists in the target object store.",
  "A problem has been detected and Windows has been shut down to prevent damage to your computer. The problem seems to be caused by the following file: kbdhid.sys If this is the first time you've seen this stop error screen, restart your computer. If this screen appears again, follow these steps: Check to make sure any new hardware or software is properly installed. If this is a new installation, ask your hardware or software manufacturer for any Windows updates you might need. If problems continue, disable or remove any newly installed hardware or software. Disable BIOS memory options such as caching or shadowing. If you need to use safe mode to remove or disable components, restart your computer, press F8 to select Advanced Startup Options, and then select Safe Mode. Technical Information: STOP: OxOOOOOOe2 (Oxoooooooo, OXOOOOOOOO, OXOOOOOOOO, OXOOOOOOOO) kbdhid.sys - Address Ox94efd1aa base at Ox94efb000 DateStamp Ox4a5bc705",
  "java-lang. Error: signal II (SIGSEGV), code I (SEGV_WERR), fault addr oøøæ24\n\nBuild fingerprint:\nRevision: '2'\npid: 8452, tid: 11239, name: cor.mygame.test.re øøøøøøøø rl 657eøø48 r2 øøøeøøcc r3 oøøøøeoø653af7eØ eøøøøecc r6 øøøeøøøe r7 657eee54r8 øøøøøwø r9 653af7ee sl øøæøøe2 fp 64fb1c4øip øøøøøæø sp 64fb1bd8 Ir 6339413' pc 63394488 cpsr 42504655\n\nIibunity.øøaøca88(Native Method)\nIibc. _thread_ent ry (_th read_entry : 72)\nIibc. pthread_c : 240)",
  "A Java error occurred in the main process. \n\nUncaught Exception:\nError. The specified module could not be found.\n\nInvalid Directory: \nFiles/Android/Data/com.google.android.youtube/cache/AndroidManifest.xml 89:13\nlabel property not defined.\n\nAt process.func [as dlopen]\nat Object.Module._extensions..node (interna V\nat Object.func [as .node)\nat Module.load\nat tryModuleLoad\nat Function.Module._load\nat Module.require (internal/mödules/cjs/Ioader.js.739:19)",
];

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: darkModeOn ? Color(0xFF282828) : Colors.white,
        // scaffoldBackgroundColor: Colors.white,
        brightness: darkModeOn ? Brightness.light : Brightness.dark,
        accentColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var rnd;
  int currentIndex = 0;

  void setNavBar(bool isDarkMode) {
    if (isDarkMode) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    rnd = new Random();
    delay = rnd.nextInt(3) + 2;
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    darkModeOn = brightness == Brightness.dark;
    keyWord = darkModeOn ? 'dark' : 'light';

    /* SystemChrome.setSystemUIOverlayStyle(
      /* SystemUiOverlayStyle(
        systemNavigationBarColor: darkModeOn ? Colors.black : Colors.white,
        systemNavigationBarIconBrightness: darkModeOn ? Brightness.light : Brightness.dark,
      ), */
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    ); */
    setNavBar(darkModeOn);
    exitApp();
  }

  void exitApp() async {
    await Future.delayed(
      Duration(
        seconds: 5,
      ),
    );
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(
            24,
            20,
            24,
            8,
          ),
          backgroundColor: darkModeOn ? Color(0xFF282828) : Colors.white,
          title: Text(
            'SDK Version Error',
            style: TextStyle(
              color: darkModeOn ? Colors.white : Colors.black,
            ),
          ),
          content: Text(
            errors[4],
            style: TextStyle(
              color: darkModeOn ? Colors.white : Colors.black,
            ),
          ),
          actions: [
            TextButton(
              child: Text('CLOSE'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
    exit(1);
  }

  Widget bottomNavBar() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 8,
      ),
      color: Colors.blue,
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.home_outlined,
                  color: darkModeOn ? Colors.white : Colors.black,
                ),
                Text(
                  'Home',
                  style: TextStyle(
                    color: darkModeOn ? Colors.white : Colors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.explore_outlined,
                  color: darkModeOn ? Colors.white : Colors.black,
                ),
                Text(
                  'Explore',
                  style: TextStyle(
                    color: darkModeOn ? Colors.white : Colors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_circle_outline,
                  color: darkModeOn ? Colors.white : Colors.black,
                ),
                /* Text(
                  'Home',
                  style: TextStyle(
                    color: darkModeOn ? Colors.white : Colors.black,
                  ),
                ), */
              ],
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.subscriptions_outlined,
                  color: darkModeOn ? Colors.white : Colors.black,
                ),
                Text(
                  'Subscriptions',
                  style: TextStyle(
                    color: darkModeOn ? Colors.white : Colors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.video_library_outlined,
                  color: darkModeOn ? Colors.white : Colors.black,
                ),
                Text(
                  'Library',
                  style: TextStyle(
                    color: darkModeOn ? Colors.white : Colors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkModeOn ? Color(0xFF282828) : Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: darkModeOn ? Color(0xFF282828) : Colors.white,
        leadingWidth: 100,
        leading: Padding(
          padding: EdgeInsets.only(left: 12.0),
          /* child: Image.asset(
            'yt_logo_$keyWord.png',
          ), */
          child: Image(
            // image: AssetImage('$keyWord\\_header.png'),
            image: AssetImage(
              'assets/yt_logo_$keyWord.png',
            ),
          ),
        ),
        actions: <IconButton>[
          IconButton(
            icon: Icon(
              Icons.cast,
            ),
            onPressed: () {},
            color: darkModeOn ? Colors.white : Colors.black,
          ),
          IconButton(
            icon: Icon(
              Icons.notifications_outlined,
            ),
            onPressed: () {},
            color: darkModeOn ? Colors.white : Colors.black,
          ),
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {},
            color: darkModeOn ? Colors.white : Colors.black,
          ),
          IconButton(
            icon: Icon(
              Icons.account_circle,
              size: 28,
            ),
            onPressed: () {},
            color: darkModeOn ? Colors.white : Colors.black,
          ),
        ],
      ),
      body: SafeArea(
        child:
            /* Column(
          children: <Widget>[
            /* Image(
              // image: AssetImage('$keyWord\\_header.png'),
              image: AssetImage('assets/images/$keyWord\_header.png'),
              fit: BoxFit.fitWidth,
            ), */
            /* Image.asset(
              'images/light_header',
              fit: BoxFit.fitWidth,
            ), */
            Spacer(),
            Center(
              child: CircularProgressIndicator(),
            ),
            Spacer(),
            /* Image.asset(
              'images/light_footer',
              fit: BoxFit.fitWidth,
            ), */
            /* Image(
              // image: AssetImage('$keyWord\\_footer.png'),
              image: AssetImage('assets/images/$keyWord\_footer.png'),
              fit: BoxFit.fitWidth,
            ), */
          ],
        ), */
            Center(
          child: CircularProgressIndicator(),
        ),
      ),

      /* body: Container(
        color: Colors.lime,
      ), */
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: darkModeOn ? Color(0xFF282828) : Colors.white,
        selectedItemColor: darkModeOn ? Colors.white : Colors.black,
        unselectedItemColor: darkModeOn ? Colors.white : Colors.black,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        // unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        onTap: (i) {
          setState(() {
            currentIndex = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            activeIcon: Icon(
              Icons.home,
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore_outlined,
            ),
            activeIcon: Icon(
              Icons.explore,
            ),
            title: Text('Explore'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline,
              size: 32,
            ),
            activeIcon: Icon(
              Icons.add_circle,
              size: 32,
            ),
            // label: 'Add',
            // label: '',
            title: Container(height: 0),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.subscriptions_outlined,
            ),
            activeIcon: Icon(
              Icons.subscriptions,
            ),
            title: Text('Subscriptions'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.video_library_outlined,
            ),
            activeIcon: Icon(
              Icons.video_library,
            ),
            title: Text('Library'),
          ),
        ],
      ),
      // bottomNavBar(),
    );
  }
}
