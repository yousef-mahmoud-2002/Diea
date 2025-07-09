import 'package:diea/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'cubits/add_products/add_products_cubit.dart';
import 'services/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ar', null);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Diea());
}

class Diea extends StatelessWidget {
  const Diea({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductsCubit(),
      child: MaterialApp(
        title: 'Diea',
        home: const HomeView(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          primaryColorLight: Colors.black,
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.deepOrange,
        ),
      ),
    );
  }
}
