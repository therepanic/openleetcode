function sortByBits(arr: number[]): number[] {
  return arr.sort((a, b) => {
    const ca = a.toString(2).split("1").length - 1;
    const cb = b.toString(2).split("1").length - 1;
    if (ca !== cb) return ca - cb;
    return a - b;
  });
}
