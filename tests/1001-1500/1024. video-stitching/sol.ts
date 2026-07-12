function videoStitching(clips: number[][], time: number): number {
  clips.sort((a, b) => a[0] - b[0]);
  let end = 0;
  let farthest = 0;
  let res = 0;
  let i = 0;
  while (farthest < time) {
    const prevFarthest = farthest;
    while (i < clips.length && clips[i][0] <= end) {
      farthest = Math.max(farthest, clips[i][1]);
      i++;
    }
    if (farthest === prevFarthest) {
      return -1;
    }
    end = farthest;
    res++;
  }
  return res;
}
