class Solution {
  int bitwiseComplement(int n) {
    if (n == 0) {
      return 1;
    }
    int bitLength = n.toRadixString(2).length;
    int mask = (1 << bitLength) - 1;
    return n ^ mask;
  }
}
