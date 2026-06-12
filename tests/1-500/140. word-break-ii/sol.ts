function wordBreak(s: string, wordDict: string[]): string[] {
  const words = new Set(wordDict);
  const memo = new Map<string, string[]>();
  const solve = (text: string): string[] => {
    const cached = memo.get(text);
    if (cached !== undefined) return cached;
    const result: string[] = [];
    if (words.has(text)) result.push(text);
    for (let i = 1; i < text.length; i++) {
      const prefix = text.slice(0, i);
      if (!words.has(prefix)) continue;
      for (const tail of solve(text.slice(i))) result.push(prefix + " " + tail);
    }
    memo.set(text, result);
    return result;
  };
  return solve(s);
}
