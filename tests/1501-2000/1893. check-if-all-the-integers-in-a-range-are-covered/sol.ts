function isCovered(ranges: number[][], left: number, right: number): boolean {
  const slots: number[] = new Array(51).fill(0);
  for (const [s, e] of ranges) {
    for (let i = s; i <= e; i++) {
      slots[i] = 1;
    }
  }
  for (let i = left; i <= right; i++) {
    if (slots[i] === 0) return false;
  }
  return true;
}
