class Solution {
  int canBeTypedWords(String text, String brokenLetters) {
    List<bool> b = List.filled(26, false);
    int res = 0;

    for (int i = 0; i < brokenLetters.length; i++) {
      b[brokenLetters.codeUnitAt(i) - 97] = true;
    }

    List<String> words = text.split(' ');
    for (String w in words) {
      bool ok = true;
      for (int i = 0; i < w.length; i++) {
        if (b[w.codeUnitAt(i) - 97]) {
          ok = false;
          break;
        }
      }
      if (ok) {
        res++;
      }
    }

    return res;
  }
}
