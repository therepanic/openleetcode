function maximalSquare(matrix: string[][]): number {
    const Rows = matrix.length;
    const Cols = matrix[0].length;
    let maxArea = 0;
    const dp: number[][] = Array.from({ length: Rows }, () => Array(Cols).fill(0));

    for (let r = Rows - 1; r >= 0; r--) {
        for (let c = Cols - 1; c >= 0; c--) {
            if (matrix[r][c] === "1") {
                const down = (r + 1 < Rows) ? dp[r + 1][c] : 0;
                const right = (c + 1 < Cols) ? dp[r][c + 1] : 0;
                const diag = (r + 1 < Rows && c + 1 < Cols) ? dp[r + 1][c + 1] : 0;
                dp[r][c] = 1 + Math.min(down, right, diag);
            } else {
                dp[r][c] = 0;
            }
            maxArea = Math.max(maxArea, dp[r][c]);
        }
    }
    return maxArea * maxArea;
}
