function checkArithmeticSubarrays(
  nums: number[],
  l: number[],
  r: number[],
): boolean[] {
  const ans: boolean[] = [];
  for (let i = 0; i < l.length; i++) {
    const sub = nums.slice(l[i], r[i] + 1).sort((a, b) => a - b);
    let valid = true;
    if (sub.length > 2) {
      const d = sub[1] - sub[0];
      for (let j = 1; j < sub.length - 1; j++) {
        if (sub[j + 1] - sub[j] !== d) {
          valid = false;
          break;
        }
      }
    }
    ans.push(valid);
  }
  return ans;
}
