function scoreOfParentheses(s: string): number {
  const scoreStack: number[] = [0];

  for (const parentheses of s) {
    if (parentheses === "(") {
      scoreStack.push(0);
    } else if (scoreStack.length > 0) {
      const lastScore = scoreStack.pop()!;
      scoreStack[scoreStack.length - 1] += Math.max(1, lastScore * 2);
    }
  }

  return scoreStack[scoreStack.length - 1];
}
