function minSwaps(s: string): number {
  let swap = 0;
  for (const char of s) {
    if (char === "[") {
      swap++;
    } else {
      if (swap > 0) {
        swap--;
      }
    }
  }
  return Math.floor((swap + 1) / 2);
}
