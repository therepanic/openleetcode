function maxCoins(nums: number[]): number {
    const balloons: number[] = [1, ...nums, 1];
    const n = balloons.length;
    const dp: number[][] = Array.from({ length: n }, () => Array(n).fill(0));
    
    for (let length = 2; length < n; length++) {
        for (let left = 0; left < n - length; left++) {
            const right = left + length;
            let best = 0;
            for (let k = left + 1; k < right; k++) {
                const gain = balloons[left] * balloons[k] * balloons[right];
                const total = gain + dp[left][k] + dp[k][right];
                if (total > best) {
                    best = total;
                }
            }
            dp[left][right] = best;
        }
    }
    
    return dp[0][n-1];
}
