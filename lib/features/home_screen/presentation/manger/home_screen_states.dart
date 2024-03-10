
class HomeScreenStates {
  final bool isLoading;

  HomeScreenStates({
    this.isLoading = false,
  });

  HomeScreenStates copyWith({
    bool? isLoading,
  }) {
    return HomeScreenStates(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
