class Solution {
  int countTriplets(List<int> nums) {
    int most = nums.reduce((a, b) => a > b ? a : b);
    if (most == 0) return nums.length * nums.length * nums.length;

    int bits = most.bitLength;
    int N = 1 << bits;

    List<int> c = List.filled(N, 0);
    for (int num in nums) {
      c[num]++;
    }

    for (int h = 1; h < N; h <<= 1) {
      for (int s = 0; s < N; s += h << 1) {
        for (int i = s; i < s + h; i++) {
          c[i] += c[i + h];
        }
      }
    }

    for (int i = 0; i < N; i++) {
      c[i] = c[i] * c[i] * c[i];
    }

    for (int h = 1; h < N; h <<= 1) {
      for (int s = 0; s < N; s += h << 1) {
        for (int i = s; i < s + h; i++) {
          c[i] -= c[i + h];
        }
      }
    }

    return c[0];
  }
}
