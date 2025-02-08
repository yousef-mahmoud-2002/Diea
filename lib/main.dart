import 'package:diea/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'constants.dart';
import 'cubits/add_products/add_products_cubit.dart';
import 'services/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const Diea());
}

class Diea extends StatelessWidget {
  const Diea({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductsCubit(),
      child: MaterialApp(
        title: ktitle,
        home: const HomeView(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          fontFamily: 'Muli',
          primaryColorLight: Colors.black,
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.deepOrange,
        ),
      ),
    );
  }
}
