function findClosestElements(arr: number[], k: number, x: number): number[] {
  return arr
    .sort((a, b) => {
      const da = Math.abs(a - x);
      const db = Math.abs(b - x);
      if (da !== db) return da - db;
      return a - b;
    })
    .slice(0, k)
    .sort((a, b) => a - b);
}
