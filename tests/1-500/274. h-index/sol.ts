function hIndex(citations: number[]): number {
  citations.sort((a, b) => b - a);
  let count = 0;
  for (let i = 0; i < citations.length; i++) {
    if (citations[i] >= i + 1) {
      count = i + 1;
    } else {
      break;
    }
  }
  return count;
}
