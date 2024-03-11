
class SavedMrzStates {
  final bool isLoading;

  SavedMrzStates({
    this.isLoading = false,
  });

  SavedMrzStates copyWith({
    bool? isLoading,
  }) {
    return SavedMrzStates(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
