function equalSubstring(s: string, t: string, maxCost: number): number {
  let ans = 0,
    cost = 0,
    left = 0;
  for (let right = 0; right < s.length; right++) {
    cost += Math.abs(s.charCodeAt(right) - t.charCodeAt(right));
    while (cost > maxCost) {
      cost -= Math.abs(s.charCodeAt(left) - t.charCodeAt(left));
      left++;
    }
    const size = right - left + 1;
    if (size > ans) {
      ans = size;
    }
  }
  return ans;
}
