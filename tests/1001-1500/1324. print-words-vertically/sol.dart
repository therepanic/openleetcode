class Solution {
  List<String> printVertically(String s) {
    final words = s.split(' ');
    var maxLen = 0;
    for (final word in words) {
      if (word.length > maxLen) {
        maxLen = word.length;
      }
    }

    final result = <String>[];
    for (var col = 0; col < maxLen; col++) {
      final buffer = StringBuffer();
      for (final word in words) {
        if (col < word.length) {
          buffer.write(word[col]);
        } else {
          buffer.write(' ');
        }
      }
      result.add(buffer.toString().trimRight());
    }

    return result;
  }
}
