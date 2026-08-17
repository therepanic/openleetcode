function splitPainting(segments: number[][]): number[][] {
  const events: [number, number][] = [];
  for (const seg of segments) {
    events.push([seg[0], seg[2]]);
    events.push([seg[1], -seg[2]]);
  }
  events.sort((a, b) => a[0] - b[0]);

  const ans: number[][] = [];
  let prev = -1;
  let mix = 0;
  for (const [pos, val] of events) {
    if (prev !== -1) {
      if (pos !== prev && mix !== 0) {
        ans.push([prev, pos, mix]);
      }
    }
    prev = pos;
    mix += val;
  }
  return ans;
}
