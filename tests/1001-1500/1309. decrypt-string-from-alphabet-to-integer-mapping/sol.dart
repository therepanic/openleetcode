class Solution {
  String freqAlphabets(String s) {
    List<String> decoded = [];
    int index = 0;
    while (index < s.length) {
      if (index + 2 < s.length && s[index + 2] == '#') {
        int num = int.parse(s.substring(index, index + 2));
        decoded.add(String.fromCharCode('a'.codeUnitAt(0) + num - 1));
        index += 3;
      } else {
        int num = int.parse(s[index]);
        decoded.add(String.fromCharCode('a'.codeUnitAt(0) + num - 1));
        index += 1;
      }
    }
    return decoded.join('');
  }
}
