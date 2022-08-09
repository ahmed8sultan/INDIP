

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

void main() {
  runApp( MyApp());
}



class MyApp extends StatelessWidget {
   @override



   Widget build(BuildContext context) {
     return BlocProvider(create:(BuildContext context)=>AppCubit(),
    child: BlocConsumer<AppCubit,AppStates>(
         listener:(BuildContext context,AppStates state){} ,
     builder:(BuildContext context,AppStates state){
     var cubit=AppCubit.get(context);
         return MaterialApp(
           debugShowCheckedModeBanner: false,

           home: Scaffold(
             appBar: AppBar(backgroundColor: Colors.white,
               title:Text('INDIP',style: TextStyle(fontSize: 40,color: Colors.black),) ,
               leading:Padding(
                 padding: const EdgeInsets.only(left: 8.0),
                 child: Image(image: AssetImage('assets/nasa.png'),height: 90,),
               ) ,
             ),
             body: cubit.Screens[cubit.currentIndex],

             bottomNavigationBar: CurvedNavigationBar(
               onTap: (index){
                 cubit.changeindex(index);


               },

               items: [
                 Icon(Icons.home,size: 20,color: Colors.black,),
                 Icon(Icons.accessibility_new,size: 20,color: Colors.black,),
                 Icon(Icons.bluetooth,size: 20,color: Colors.black,),
                 Icon(Icons.list_alt_sharp,size: 20,color: Colors.black,),
               ],
             ),
           ),
         );

         }),
     );
   }
}




Widget textForm({
  @required name,
  @required TextEditingController controller,

  @required TextInputType texttype,
  Function ontap,
  Function validator

}) =>
    TextFormField(maxLines: 5,
      controller: controller,
      keyboardType: texttype,
      style: TextStyle(fontSize: 20),
      validator: validator,onTap: ontap,
      onChanged:(value){
        print(value);
      },
      decoration: InputDecoration(
          hintText: name,),

    );


