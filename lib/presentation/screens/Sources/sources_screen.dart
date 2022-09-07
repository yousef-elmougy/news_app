import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/constants/strings.dart';
import 'package:news/core/widgets/custom_indicator.dart';
import 'package:news/presentation/cubit/data/data_cubit.dart';
import 'package:news/presentation/cubit/data/data_cubit_state.dart';

class SourcesScreen extends StatelessWidget {
  const SourcesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
final    dataCubit = DataCubit.get(context);
dataCubit.getSources();
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
        centerTitle: true,
      ),
      body: BlocBuilder<DataCubit, DataState>(
        builder: (BuildContext context, state) {
          if(dataCubit.sources!.isEmpty){
            return const CustomIndicator();
          }else{
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 10,
                ),
                itemCount: dataCubit.sources?.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, AppStrings.sourcesDetailsScreen,arguments: dataCubit.sources?[index]);
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              '${AppStrings.pathLogo}/${dataCubit.sources?[index].id}.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
