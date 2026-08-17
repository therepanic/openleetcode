class Solution {
  int minPartitions(String n) {
    int max = 0;
    for (int i = 0; i < n.length; i++) {
      int digit = n.codeUnitAt(i) - 48;
      if (digit > max) max = digit;
    }
    return max;
  }
}
