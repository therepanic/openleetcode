class Solution {
  String largestMerge(String word1, String word2) {
    final StringBuffer res = StringBuffer();
    int i = 0, j = 0;
    while (i < word1.length && j < word2.length) {
      if (word1.codeUnitAt(i) > word2.codeUnitAt(j)) {
        res.writeCharCode(word1.codeUnitAt(i));
        i++;
      } else if (word1.codeUnitAt(i) < word2.codeUnitAt(j)) {
        res.writeCharCode(word2.codeUnitAt(j));
        j++;
      } else {
        int p = i, q = j;
        while (p < word1.length && q < word2.length && word1.codeUnitAt(p) == word2.codeUnitAt(q)) {
          p++;
          q++;
        }
        if (q == word2.length || (p < word1.length && word1.codeUnitAt(p) > word2.codeUnitAt(q))) {
          res.writeCharCode(word1.codeUnitAt(i));
          i++;
        } else {
          res.writeCharCode(word2.codeUnitAt(j));
          j++;
        }
      }
    }
    while (i < word1.length) {
      res.writeCharCode(word1.codeUnitAt(i));
      i++;
    }
    while (j < word2.length) {
      res.writeCharCode(word2.codeUnitAt(j));
      j++;
    }
    return res.toString();
  }
}
