import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bluetooth/bluetooth.dart';
import '../home.dart';
import '../human.dart';
import '../info.dart';
import 'states.dart';


class AppCubit extends Cubit<AppStates>{
AppCubit():super(AppInitialState());

static AppCubit get(context) => BlocProvider.of(context);
int currentIndex=0;


List <Widget> Screens =[
  const home(),
  human(),
  bluetooth(),
  info(),

];
void changeindex(int index) {
  currentIndex = index;
  emit(NavBar());
}


}