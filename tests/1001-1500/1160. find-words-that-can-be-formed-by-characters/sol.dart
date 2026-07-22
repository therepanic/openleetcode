class Solution {
  int countCharacters(List<String> words, String chars) {
    Map<String, int> ch = {};
    for (var c in chars.split('')) {
      ch[c] = (ch[c] ?? 0) + 1;
    }
    
    int res = 0;
    for (var word in words) {
      Map<String, int> copy = Map.from(ch);
      bool good = true;
      for (var c in word.split('')) {
        if (copy.containsKey(c) && copy[c]! > 0) {
          copy[c] = copy[c]! - 1;
        } else {
          res -= word.length;
          good = false;
          break;
        }
      }
      res += word.length;
    }
    return res;
  }
}
