function canArrange(arr: number[], k: number): boolean {
  const a = arr.map((v) => ((v % k) + k) % k).sort((x, y) => x - y);
  let j = 0;
  while (j < a.length && a[j] === 0) j++;
  if (j % 2 !== 0) return false;
  const b = a.slice(j);
  for (let l = 0, r = b.length - 1; l < r; l++, r--) {
    if ((b[l] + b[r]) % k !== 0) return false;
  }
  return true;
}
