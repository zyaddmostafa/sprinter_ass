class HotOffer {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final DateTime? expiryDate;
  final bool isActive;

  const HotOffer({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.expiryDate,
    this.isActive = true,
  });

  bool get isExpired {
    if (expiryDate == null) return false;
    return DateTime.now().isAfter(expiryDate!);
  }

  bool get isValid => isActive && !isExpired;
}
