function maxUniqueSplit(s: string): number {
  const used = new Set<string>();
  let ans = 0;

  function backtrack(index: number): void {
    if (index === s.length) {
      ans = Math.max(ans, used.size);
      return;
    }
    for (let j = index; j < s.length; j++) {
      const curr = s.substring(index, j + 1);
      if (used.has(curr)) continue;
      used.add(curr);
      backtrack(j + 1);
      used.delete(curr);
    }
  }

  backtrack(0);
  return ans;
}
