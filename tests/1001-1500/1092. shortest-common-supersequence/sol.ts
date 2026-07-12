function Solution() {
  return {
    shortestCommonSupersequence(str1: string, str2: string): string {
      const m = str1.length,
        n = str2.length;
      const dp: number[][] = Array.from({ length: m + 1 }, () =>
        Array(n + 1).fill(0),
      );
      for (let i = 1; i <= m; i++) {
        for (let j = 1; j <= n; j++) {
          dp[i][j] =
            str1[i - 1] === str2[j - 1]
              ? dp[i - 1][j - 1] + 1
              : Math.max(dp[i - 1][j], dp[i][j - 1]);
        }
      }
      let i = m,
        j = n;
      const out: string[] = [];
      while (i > 0 && j > 0) {
        if (str1[i - 1] === str2[j - 1]) {
          out.push(str1[i - 1]);
          i--;
          j--;
        } else if (dp[i - 1][j] >= dp[i][j - 1]) {
          out.push(str1[i - 1]);
          i--;
        } else {
          out.push(str2[j - 1]);
          j--;
        }
      }
      while (i > 0) {
        out.push(str1[i - 1]);
        i--;
      }
      while (j > 0) {
        out.push(str2[j - 1]);
        j--;
      }
      return out.reverse().join("");
    },
  };
}
