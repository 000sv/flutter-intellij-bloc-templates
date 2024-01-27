class ${ClassName}Repository {
  //region - Public Methods

  Future<String> fetchData() async {
    // Simulate 2 seconds delay
    await Future.delayed(const Duration(seconds: 2));
    // Return result
    return 'Data retrieved from repository.';
  }

  //endregion
}
