function winnerSquareGame(n: number): boolean {
  const memo: number[][] = Array.from({ length: 2 }, () =>
    Array(n + 1).fill(-1),
  );
  const dp = (player: number, stones: number): boolean => {
    if (stones === 0) return false;
    if (memo[player][stones] !== -1) return memo[player][stones] === 1;
    const sqrt = Math.floor(Math.sqrt(stones));
    for (let i = sqrt; i >= 1; i--) {
      const sq = i * i;
      if (sq === stones || !dp(player ^ 1, stones - sq)) {
        memo[player][stones] = 1;
        return true;
      }
    }
    memo[player][stones] = 0;
    return false;
  };
  return dp(0, n);
}
