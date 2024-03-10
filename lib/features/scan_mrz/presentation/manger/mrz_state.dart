
class MrzState {
  final bool isPermissionGranted;
  final bool isLoading;

  MrzState({
    required this.isPermissionGranted,
    this.isLoading = false,
  });

  MrzState copyWith({
    bool? isPermissionGranted,
    bool? isLoading,
  }) {
    return MrzState(
      isPermissionGranted: isPermissionGranted ?? this.isPermissionGranted,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
