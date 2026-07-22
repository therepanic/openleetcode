class Solution {
  int countVowelPermutation(int n) {
    const int MOD = 1000000007;
    int a = 1, e = 1, i = 1, o = 1, u = 1;
    for (int k = 1; k < n; k++) {
      int na = (e + i + u) % MOD;
      int ne = (a + i) % MOD;
      int ni = (e + o) % MOD;
      int no = i % MOD;
      int nu = (i + o) % MOD;
      a = na;
      e = ne;
      i = ni;
      o = no;
      u = nu;
    }
    return ((((a + e) % MOD + i) % MOD + o) % MOD + u) % MOD;
  }
}
