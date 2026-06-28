class Solution {
  static const int MOD = 1000000007;

  List<List<int>> multiply(List<List<int>> A, List<List<int>> B) {
    List<List<int>> C = List.generate(3, (_) => List.filled(3, 0));
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        int s = 0;
        for (int k = 0; k < 3; k++) {
          s = (s + A[i][k] * B[k][j]) % MOD;
        }
        C[i][j] = s;
      }
    }
    return C;
  }

  List<List<int>> power(List<List<int>> base, int exp) {
    List<List<int>> result = [
      [1, 0, 0],
      [0, 1, 0],
      [0, 0, 1]
    ];
    while (exp > 0) {
      if ((exp & 1) == 1) {
        result = multiply(result, base);
      }
      base = multiply(base, base);
      exp >>= 1;
    }
    return result;
  }

  int numTilings(int n) {
    if (n == 0) return 1;
    if (n == 1) return 1;
    if (n == 2) return 2;
    List<List<int>> t = [
      [2, 0, 1],
      [1, 0, 0],
      [0, 1, 0]
    ];
    List<List<int>> p = power(t, n - 2);
    return (p[0][0] * 2 + p[0][1] + p[0][2]) % MOD;
  }
}
