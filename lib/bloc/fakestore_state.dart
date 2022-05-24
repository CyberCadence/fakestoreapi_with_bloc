part of 'fakestore_bloc.dart';

@immutable
abstract class FakestoreState {}

class FakestoreInitialstate extends FakestoreState {}

class Fakestorelaodingstate extends FakestoreState {}

class Fakestoreloadedstate extends FakestoreState {
  final List<FakeStore> apiresult;

  Fakestoreloadedstate({ required this.apiresult});
}

class FAkestoreErrorstate extends FakestoreState {}
