class Solution {
  bool makeEqual(List<String> words) {
    List<int> freq = List.filled(26, 0);
    int n = words.length;
    for (String word in words) {
      for (int i = 0; i < word.length; i++) {
        freq[word.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;
      }
    }
    for (int count in freq) {
      if (count % n != 0) {
        return false;
      }
    }
    return true;
  }
}
