import 'dart:math';

String generateUniqueId() {
  final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final random = Random().nextInt(1000).toString().padLeft(3, '0');
  return '${timestamp}_$random';
}
