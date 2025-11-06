class TodayPlanData {
  final String title;
  final String subtitle;
  final String imagePath; // or use a URL and Image.network
  final String level;     // Beginner / Intermediate / Advanced
  final double progress;  // 0.0 - 1.0

  TodayPlanData({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.level,
    required this.progress,
  });
}