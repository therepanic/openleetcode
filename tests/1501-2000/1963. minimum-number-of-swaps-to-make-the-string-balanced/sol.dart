class Solution {
  int minSwaps(String s) {
    int swap = 0;
    for (int i = 0; i < s.length; i++) {
      if (s[i] == '[') {
        swap++;
      } else {
        if (swap > 0) {
          swap--;
        }
      }
    }
    return (swap + 1) ~/ 2;
  }
}
