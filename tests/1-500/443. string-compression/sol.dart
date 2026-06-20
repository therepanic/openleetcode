class Solution {
  int compress(List<String> chars) {
    int i = 0, j = 0;
    while (j < chars.length) {
      String c = chars[j];
      int count = 0;
      while (j < chars.length && chars[j] == c) {
        j++;
        count++;
      }
      chars[i++] = c;
      if (count > 1) {
        for (var ch in count.toString().split('')) {
          chars[i++] = ch;
        }
      }
    }
    return i;
  }
}
