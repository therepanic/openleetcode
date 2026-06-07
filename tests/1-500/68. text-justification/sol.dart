class Solution {
  List<String> fullJustify(List<String> words, int maxWidth) {
    final res = <String>[];
    var i = 0;

    while (i < words.length) {
      var j = i;
      var lineLen = 0;
      while (j < words.length && lineLen + words[j].length + (j - i) <= maxWidth) {
        lineLen += words[j].length;
        j++;
      }

      final spaces = maxWidth - lineLen;
      final gaps = j - i - 1;
      final buffer = StringBuffer();

      if (j == words.length || gaps == 0) {
        for (var k = i; k < j; k++) {
          if (k > i) {
            buffer.write(' ');
          }
          buffer.write(words[k]);
        }
        buffer.write(' ' * (maxWidth - buffer.length));
      } else {
        final each = spaces ~/ gaps;
        var extra = spaces % gaps;
        for (var k = i; k < j; k++) {
          buffer.write(words[k]);
          if (k < j - 1) {
            final count = each + (extra > 0 ? 1 : 0);
            buffer.write(' ' * count);
            if (extra > 0) {
              extra--;
            }
          }
        }
      }

      res.add(buffer.toString());
      i = j;
    }

    return res;
  }
}
