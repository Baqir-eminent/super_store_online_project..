
import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:super_store_online_project/common/utils/custom_snackbar.dart';
import 'package:super_store_online_project/features/features_intro/presentation/bloc/splash_cubit/splash_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen ({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    // gotoHome();

  BlocProvider.of<SplashCubit>(context).checkConnectionEvent();
  }
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        color: Colors.yellowAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child:DelayedWidget(
               delayDuration:const Duration(milliseconds: 200),
               animationDuration: const Duration(milliseconds: 1000),
              animation: DelayedAnimations.SLIDE_FROM_TOP,
        child: Image.asset('assets/images/123.png',width: width * 0.8,))),


             BlocConsumer<SplashCubit, SplashState>(
                 builder: (context, state){
             if(state.connectionStatus is ConnectionInitial || state.connectionStatus is ConnectionOn){

               return Directionality(
                   textDirection: (TextDirection.ltr),
                   child: LoadingAnimationWidget.prograssiveDots(
                     color: Colors.green,
                     size: 50,
                   ),
               );
             }
             if(state.connectionStatus is ConnectionOf){
               return Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   const Text('you are not connected to net! ', style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w500)),
                   IconButton(
                       splashColor: Colors.red,
                       onPressed: (){
                         BlocProvider.of<SplashCubit>(context).checkConnectionEvent();
                         

                       }, icon: const Icon(Icons.autorenew,color: Colors.red,))

                 ],
               );
             }
             return Container();
             },
                 listener: (context, state){
               if(state.connectionStatus is ConnectionOn){
                 gotoHome();
               }
                 }
             ),
              const SizedBox(height: 30,),

         ],
        ),
      ),
    );
  }
  Future<void> gotoHome(){
  return Future.delayed(const Duration(seconds: 1),(){
    CustomSnackBar.showSnack(context, "you loged in", Colors.white70);
    });
  }
}
