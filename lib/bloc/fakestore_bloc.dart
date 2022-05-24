import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:randomapi/model/Modelclass.dart';
import 'package:randomapi/network/repository.dart';

part 'fakestore_event.dart';
part 'fakestore_state.dart';

class FakestoreBloc extends Bloc<FakestoreEvent, FakestoreState> {
  final Repository repository;

  FakestoreBloc({required this.repository}) : super(FakestoreInitialstate()) {
    on<FakestoreEvent>((event, emit) async {
      if (event is StorelaodEvent) {
        emit(Fakestorelaodingstate());
        List<FakeStore>? apiresult = await repository.getdata();

        if (apiresult == null) {
          emit(FAkestoreErrorstate());
        } else {
          emit(Fakestoreloadedstate(apiresult: apiresult));
        }
      }
    });
  }
}
