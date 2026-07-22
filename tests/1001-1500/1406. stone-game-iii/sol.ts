function stoneGameIII(stoneValue: number[]): string {
  const n: number = stoneValue.length;
  const dp: number[] = [0, 0, 0];

  for (let i = n - 1; i >= 0; i--) {
    const takeOne: number = stoneValue[i] - dp[(i + 1) % 3];

    let takeTwo: number = -Infinity;
    if (i + 1 < n) {
      takeTwo = stoneValue[i] + stoneValue[i + 1] - dp[(i + 2) % 3];
    }

    let takeThree: number = -Infinity;
    if (i + 2 < n) {
      takeThree =
        stoneValue[i] + stoneValue[i + 1] + stoneValue[i + 2] - dp[(i + 3) % 3];
    }

    dp[i % 3] = Math.max(takeOne, takeTwo, takeThree);
  }

  const value: number = dp[0];
  if (value > 0) {
    return "Alice";
  } else if (value < 0) {
    return "Bob";
  } else {
    return "Tie";
  }
}
