import 'package:e_commerce/blocs/cart/cart_bloc.dart';
import 'package:e_commerce/blocs/wishlist/wishlist_bloc.dart';
import 'package:e_commerce/config/app_router.dart';
import 'package:e_commerce/config/theme.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WishlistBloc>(create: (_) => WishlistBloc()..add(StartWishList())),
        BlocProvider<CartBloc>(create: (_) => CartBloc()..add(CartStarted())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        home: const HomeScreen(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
