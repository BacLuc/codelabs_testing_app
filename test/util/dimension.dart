class Dimension {
  final double width;
  final double height;

  Dimension({required this.width, required this.height});

  @override
  String toString() {
    return '${width}x$height';
  }
}
