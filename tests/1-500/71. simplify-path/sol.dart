class Solution {
  String simplifyPath(String path) {
    final parts = <String>[];
    for (final part in path.split('/')) {
      if (part.isEmpty || part == '.') {
        continue;
      }
      if (part == '..') {
        if (parts.isNotEmpty) {
          parts.removeLast();
        }
      } else {
        parts.add(part);
      }
    }
    return '/${parts.join('/')}';
  }
}
