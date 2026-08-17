class Solution {
  int longestBeautifulSubstring(String word) {
    int n = word.length;
    int i = 0;
    int length = 0;

    while (i < n) {
      if (word[i] != 'a') {
        i++;
        continue;
      }

      int j = i;
      int unique = 1;
      while (j + 1 < n && word[j + 1].compareTo(word[j]) >= 0) {
        if (word[j + 1] != word[j]) {
          unique++;
        }
        j++;
      }

      if (unique == 5) {
        length = (j - i + 1 > length) ? j - i + 1 : length;
      }

      i = j + 1;
    }

    return length;
  }
}
