function getMoneyAmount(n: number): number {
    const dp: number[][] = Array.from({ length: n + 1 }, () => Array(n + 1).fill(0));
    for (let length = 2; length <= n; length++) {
        for (let start = n - length + 1; start >= 1; start--) {
            const end = start + length - 1;
            dp[start][end] = Infinity;
            for (let pivot = start; pivot <= end; pivot++) {
                const left = pivot > start ? dp[start][pivot - 1] : 0;
                const right = pivot < end ? dp[pivot + 1][end] : 0;
                dp[start][end] = Math.min(dp[start][end], pivot + Math.max(left, right));
            }
        }
    }
    return dp[1][n];
}
