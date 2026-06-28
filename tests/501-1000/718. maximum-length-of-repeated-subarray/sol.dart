class Solution {
  int findLength(List<int> nums1, List<int> nums2) {
    const P = 113;
    const MOD = 1000000007;
    final Pinv = modPow(P, MOD - 2, MOD);

    bool check(int guess) {
      if (guess == 0) return true;

      final hashes = <int, List<int>>{};

      // nums1
      int h = 0;
      int power = 1;
      for (int i = 0; i < nums1.length; i++) {
        h = (h + nums1[i] * power) % MOD;
        if (i < guess - 1) {
          power = (power * P) % MOD;
        } else {
          int start = i - (guess - 1);
          hashes.putIfAbsent(h, () => []).add(start);
          h = (h - nums1[start]) * Pinv % MOD;
        }
      }

      // nums2
      h = 0;
      power = 1;
      for (int i = 0; i < nums2.length; i++) {
        h = (h + nums2[i] * power) % MOD;
        if (i < guess - 1) {
          power = (power * P) % MOD;
        } else {
          int start = i - (guess - 1);
          if (hashes.containsKey(h)) {
            for (int idx in hashes[h]!) {
              if (listEquals(nums1, idx, nums2, start, guess)) {
                return true;
              }
            }
          }
          h = (h - nums2[start]) * Pinv % MOD;
        }
      }
      return false;
    }

    int lo = 0;
    int hi = nums1.length < nums2.length ? nums1.length : nums2.length;
    hi += 1;

    while (lo < hi) {
      int mi = (lo + hi) ~/ 2;
      if (check(mi)) {
        lo = mi + 1;
      } else {
        hi = mi;
      }
    }
    return lo - 1;
  }

  bool listEquals(List<int> a, int i, List<int> b, int j, int len) {
    for (int k = 0; k < len; k++) {
      if (a[i + k] != b[j + k]) return false;
    }
    return true;
  }

  int modPow(int base, int exp, int mod) {
    int result = 1;
    int b = base % mod;
    int e = exp;
    while (e > 0) {
      if (e & 1 == 1) result = (result * b) % mod;
      b = (b * b) % mod;
      e >>= 1;
    }
    return result;
  }
}
