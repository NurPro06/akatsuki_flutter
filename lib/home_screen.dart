import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/akatsuki_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cubit = AkatsukiCubit()..getAkatsuki();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Akatsuki List'),
        ),
        body: BlocBuilder<AkatsukiCubit, AkatsukiState>(
          bloc: cubit,
          builder: (context, state) {
            if (state is AkatsukiDataSuccess) {
              return ListView.builder(
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  final akatsuki = state.list[index];
                  return ListTile(
                    title: Text(akatsuki.name),
                    leading: akatsuki.images.isNotEmpty
                        ? Image.network(
                      akatsuki.images.first,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                    )
                        : const Icon(Icons.image_not_supported),
                  );
                },
              );
            } else if (state is AkatsukiDataLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: Text('Failed to load data'));
            }
          },
        ),
      ),
    );
  }
}