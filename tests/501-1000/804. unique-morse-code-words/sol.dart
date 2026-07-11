class Solution {
  int uniqueMorseRepresentations(List<String> words) {
    final storage = [
      ".-", "-...", "-.-.", "-..", ".", "..-.", "--.",
      "....", "..", ".---", "-.-", ".-..", "--", "-.",
      "---", ".--.", "--.-", ".-.", "...", "-", "..-",
      "...-", ".--", "-..-", "-.--", "--.."
    ];

    final st = <String>{};

    for (final word in words) {
      String temp = "";
      for (final ch in word.split('')) {
        temp += storage[ch.codeUnitAt(0) - 'a'.codeUnitAt(0)];
      }
      st.add(temp);
    }

    return st.length;
  }
}
