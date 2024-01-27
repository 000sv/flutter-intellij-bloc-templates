abstract class ${ClassName}State {}

/// Initial State
class ${ClassName}InitialState extends ${ClassName}State {}

/// Loading State
class ${ClassName}LoadingState extends ${ClassName}State {}

/// Data Loaded State
class ${ClassName}DataLoadedState extends ${ClassName}State {
  final String data;

  ${ClassName}DataLoadedState(this.data);
}

/// Error State
class ${ClassName}ErrorState extends ${ClassName}State {
  final String data;

  ${ClassName}ErrorState(this.data);
}