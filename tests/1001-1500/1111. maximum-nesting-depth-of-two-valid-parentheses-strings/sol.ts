function maxDepthAfterSplit(seq: string): number[] {
  const res: number[] = [];
  let depth = 0;
  for (const ch of seq) {
    if (ch === "(") {
      depth++;
      res.push(depth % 2);
    } else {
      res.push(depth % 2);
      depth--;
    }
  }
  return res;
}
