function findMaxForm(strs: string[], m: number, n: number): number {
  let dp: Map<string, number> = new Map();
  dp.set("0,0", 0);
  for (const s of strs) {
    let zeros = 0,
      ones = 0;
    for (const c of s) {
      if (c === "0") zeros++;
      else ones++;
    }
    const newDp = new Map(dp);
    dp.forEach((size, key) => {
      const [z, o] = key.split(",").map(Number);
      const newZ = z + zeros;
      const newO = o + ones;
      if (newZ <= m && newO <= n) {
        const newKey = `${newZ},${newO}`;
        newDp.set(newKey, Math.max(newDp.get(newKey) || 0, size + 1));
      }
    });
    dp = newDp;
  }
  return Math.max(...dp.values());
}
