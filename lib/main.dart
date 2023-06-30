import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:sanshipt/providers/user_provider.dart';
import 'package:sanshipt/screens/home.dart';
import 'package:sanshipt/screens/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyAgbxD81amoZVtGpi_vGYM8yETNnd_BiNE',
        appId: '1:781638059737:android:76c1dce014ad4d8ad460c8',
        messagingSenderId: '781638059737',
        projectId: 'sanshipt-5232c',
        storageBucket: "sanshipt-5232c.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(
      const MaterialApp(
        home: MyApp(),
        debugShowCheckedModeBanner: false,
      ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// class _MyAppState extends State<MyApp> {
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if(snapshot.hasData){
//             return Home();
//           }
//           else{
//             return Signup()
//           }
//         },
//       ),
//     );
//   }
// }

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          color: const Color.fromARGB(255, 60, 60, 60),
          theme: ThemeData.dark(),
          // home: FirebaseAuth.instance.currentUser?.uid == null ? Signup() : Home(),
          home:Signup()
        ),
      ),
    );
  }
}
