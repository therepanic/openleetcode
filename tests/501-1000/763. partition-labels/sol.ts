function partitionLabels(s: string): number[] {
  if (s.length === 1) {
    return [1];
  }
  const seen: Map<string, number[]> = new Map();
  for (let i = 0; i < s.length; i++) {
    const ch = s[i];
    if (!seen.has(ch)) {
      seen.set(ch, [i, i]);
    } else {
      seen.get(ch)![1] = i;
    }
  }
  const arrSeen = Array.from(seen.values());
  const merged: number[][] = [arrSeen[0]];
  for (let i = 1; i < arrSeen.length; i++) {
    const last = merged[merged.length - 1];
    const cur = arrSeen[i];
    if (last[1] >= cur[0]) {
      last[1] = Math.max(last[1], cur[1]);
    } else {
      merged.push(cur);
    }
  }
  const ans: number[] = [];
  for (const interval of merged) {
    ans.push(interval[1] - interval[0] + 1);
  }
  return ans;
}
