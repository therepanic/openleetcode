function maxLength(arr: string[]): number {
  let ans = 0;
  const n = arr.length;

  function isUnique(s: string): boolean {
    return new Set(s).size === s.length;
  }

  function hasCommon(a: string, b: string): boolean {
    const setA = new Set(a);
    for (const ch of b) {
      if (setA.has(ch)) return true;
    }
    return false;
  }

  function dfs(i: number, path: string): void {
    ans = Math.max(ans, path.length);
    for (let j = i; j < n; j++) {
      const s = arr[j];
      if (!isUnique(s) || hasCommon(path, s)) continue;
      dfs(j + 1, path + s);
    }
  }

  dfs(0, "");
  return ans;
}
