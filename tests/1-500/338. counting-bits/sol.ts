function countBits(n: number): number[] {
    const dp: number[] = new Array(n + 1).fill(0);
    let sub: number = 1;
    for (let i = 1; i <= n; i++) {
        if (sub * 2 === i) {
            sub = i;
        }
        dp[i] = dp[i - sub] + 1;
    }
    return dp;
}
