import 'package:avenue/config/config.dart';
import 'package:avenue/presentation/UI/UI.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:avenue/logic/blocs/bloc.dart';
import 'package:avenue/data/repositories/repositories.dart';
import 'n.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);

  BlocOverrides.runZoned(
        () {
      runApp(const Avenue());
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class Avenue extends StatelessWidget {
  const Avenue({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ProductBloc(productRepository: ProductRepository())..add(LoadProducts()),
        ),

        BlocProvider(
          create: (_) => CartBloc()..add(LoadCart()),
        ),



        BlocProvider(
          create: (context) => CheckoutBloc(
            cartBloc: context.read<CartBloc>(),
            checkoutRepository: CheckoutRepository(),
          ),
        ),


        BlocProvider(
          create: (_) => WishlistBloc(
            localStorageRepository: LocalStorageRepository(),)..add(StartWishlist()),),



      ],
      child: const MaterialApp(
        title: 'Avenue',
        debugShowCheckedModeBanner: false,
        home:HomePageUI(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: HomePageUI.routeName,


      ),
    );
  }
}




