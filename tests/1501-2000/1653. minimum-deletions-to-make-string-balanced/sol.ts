function minimumDeletions(s: string): number {
  let res = 0;
  let count = 0;
  for (const ch of s) {
    if (ch === "b") {
      count++;
    } else if (count > 0) {
      res++;
      count--;
    }
  }
  return res;
}
