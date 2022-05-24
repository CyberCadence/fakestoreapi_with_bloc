import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomapi/bloc/fakestore_bloc.dart';
import 'package:randomapi/network/repository.dart';
import 'package:randomapi/view/Homepage.dart';

void main() {
  runApp( BlocProvider(
    create: (context) => FakestoreBloc(repository: Repository()),
    child:const HomePage(),
  ));
}
