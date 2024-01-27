import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '${FileName}_bloc.dart';
import '${FileName}_event.dart';
import '${FileName}_repository.dart';
import '${FileName}_state.dart';

class ${ClassName}Page extends StatelessWidget {
  const ${ClassName}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('${ClassName} Page'),
      ),
      body: BlocProvider(
        create: (context) => ${ClassName}Bloc(${ClassName}Repository()),
        child: const ${ClassName}PageContent(),
      ),
    );
  }
}

class ${ClassName}PageContent extends StatelessWidget {
  const ${ClassName}PageContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Get BLoC reference
    final ${ClassName}Bloc bloc = BlocProvider.of<${ClassName}Bloc>(context);
    // Add the fetch event
    bloc.add(${ClassName}FetchEvent());

    return BlocConsumer<${ClassName}Bloc, ${ClassName}State>(
      listener: (context, state) {
        if (state is ${ClassName}DataLoadedState) {
          // Bring user to destination screen.
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => Container() /* TODO: Replace here with destination scene */));
        }
      },
      builder: (context, state) {
        if (state is ${ClassName}InitialState) {
          return _buildPlaceholder();
        } else if (state is ${ClassName}LoadingState) {
          return _buildPlaceholder();
        } else if (state is ${ClassName}DataLoadedState) {
          return _buildContent(state.data);
        } else if (state is ${ClassName}ErrorState) {
          return _buildError(state.data);
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildPlaceholder() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildContent(String data) {
    return Center(
      child: Text(data),
    );
  }

  Widget _buildError(String error) {
    return Center(
      child: Text(error),
    );
  }
}
