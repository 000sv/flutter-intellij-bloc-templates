import 'package:bloc/bloc.dart';

import '${FileName}_event.dart';
import '${FileName}_repository.dart';
import '${FileName}_state.dart';

class ${ClassName}Bloc extends Bloc<${ClassName}Event, ${ClassName}State> {
  final ${ClassName}Repository repository;

  ${ClassName}Bloc(this.repository) : super(${ClassName}InitialState()) {
    on<${ClassName}Event>((event, emit) async {
      await doSomething(emit, event);
    });
  }

  doSomething(Emitter<${ClassName}State> emit, ${ClassName}Event event) async {
    if (event is ${ClassName}FetchEvent) {
      // Loading State
      emit(${ClassName}LoadingState());

      try {
        final data = await repository.fetchData();
        // Data Loaded State
        emit(${ClassName}DataLoadedState(data));
      } catch (error) {
        // Error State
        emit(${ClassName}ErrorState('Error retrieving data.'));
      }
    }
  }
}
