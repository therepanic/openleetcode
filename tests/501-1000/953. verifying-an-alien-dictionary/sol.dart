class Solution {
  bool isAlienSorted(List<String> words, String order) {
    Map<String, int> orderMap = {};
    for (int i = 0; i < order.length; i++) {
      orderMap[order[i]] = i;
    }

    for (int i = 0; i < words.length - 1; i++) {
      String w1 = words[i];
      String w2 = words[i + 1];

      int minLen = w1.length < w2.length ? w1.length : w2.length;
      int j = 0;
      for (j = 0; j < minLen; j++) {
        if (w1[j] != w2[j]) {
          if (orderMap[w1[j]]! > orderMap[w2[j]]!) {
            return false;
          }
          break;
        }
      }
      if (j == minLen && w1.length > w2.length) {
        return false;
      }
    }

    return true;
  }
}
