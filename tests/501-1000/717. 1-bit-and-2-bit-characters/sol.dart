class Solution {
  bool isOneBitCharacter(List<int> bits) {
    int n = bits.length, i = 0;
    while (i < n - 1) {
      i += 1 + (bits[i] == 1 ? 1 : 0);
    }
    return i == n - 1;
  }
}
