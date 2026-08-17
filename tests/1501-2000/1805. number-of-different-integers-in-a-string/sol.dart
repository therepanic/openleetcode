class Solution {
  int numDifferentIntegers(String word) {
    int i = 0;
    int n = word.length;
    Set<String> st = {};
    while (i < n) {
      while (i < n && (word.codeUnitAt(i) >= 65 && word.codeUnitAt(i) <= 90 || word.codeUnitAt(i) >= 97 && word.codeUnitAt(i) <= 122)) {
        i++;
      }
      String tempInt = "";
      while (i < n && word.codeUnitAt(i) >= 48 && word.codeUnitAt(i) <= 57) {
        tempInt += word[i];
        i++;
      }
      int j = 0;
      while (j + 1 < tempInt.length && tempInt[j] == '0') {
        j++;
      }
      String k = tempInt.substring(j);
      if (k.isNotEmpty) {
        st.add(k);
      }
    }
    return st.length;
  }
}
