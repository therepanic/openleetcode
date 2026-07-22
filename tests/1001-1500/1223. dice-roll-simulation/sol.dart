class Solution {
  int dieSimulator(int n, List<int> rollMax) {
    const int MOD = 1000000007;
    int faces = 6;

    List<List<int>> f = List.generate(n, (_) => List.filled(faces, 0));
    List<int> s = List.filled(n, 0);

    for (int j = 0; j < faces; j++) {
      f[0][j] = 1;
    }
    s[0] = faces;

    for (int i = 1; i < n; i++) {
      for (int j = 0; j < faces; j++) {
        int maxRepeat = rollMax[j];
        int res = s[i - 1];

        if (i > maxRepeat) {
          res -= (s[i - maxRepeat - 1] - f[i - maxRepeat - 1][j]);
        } else if (i == maxRepeat) {
          res -= 1;
        }

        f[i][j] = ((res % MOD) + MOD) % MOD;
      }

      int sum = 0;
      for (int j = 0; j < faces; j++) {
        sum = (sum + f[i][j]) % MOD;
      }
      s[i] = sum;
    }

    return s[n - 1];
  }
}
