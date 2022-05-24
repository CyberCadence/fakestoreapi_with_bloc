import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomapi/bloc/fakestore_bloc.dart';

import '../model/Modelclass.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BlocBuilder<FakestoreBloc, FakestoreState>(
          builder: (context, state) {
            if (state is FakestoreInitialstate) {
              context.read<FakestoreBloc>().add(StorelaodEvent());
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              );
            }
            if (state is Fakestorelaodingstate) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.yellow),
              );
            }
            if (state is Fakestoreloadedstate) {
              return buildnew(state.apiresult);
            }
            if (state is FAkestoreErrorstate) {
              return const Center(
                child: Text('error in connection'),
              );
            }
            return const Center(
              child: Text('full error'),
            );
          },
        ),
      ),
    );
  }
}

Widget buildnew(List<FakeStore> apiResult) {
  return ListView.builder(itemCount: apiResult.length,
    itemBuilder: (context, index) {
    final FakeStore fakeStore = apiResult[index];
    return Row(
      children: [
        Container(margin: const EdgeInsets.only(top: 10,bottom: 10),
          width: 200,
          height: 200,
          decoration: BoxDecoration(color: Colors.grey,
              image: DecorationImage(
                  image: NetworkImage(fakeStore.image.toString()))),
        ),
    Text(fakeStore.price.toString())  ],
    );
  });
}
