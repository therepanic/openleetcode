class Solution {
  bool isSumEqual(String firstWord, String secondWord, String targetWord) {
    int convert(String word) {
      String s = "";
      for (int i = 0; i < word.length; i++) {
        s += (word.codeUnitAt(i) - 'a'.codeUnitAt(0)).toString();
      }
      return int.parse(s);
    }
    return convert(firstWord) + convert(secondWord) == convert(targetWord);
  }
}
