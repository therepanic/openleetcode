function maximumGain(s: string, x: number, y: number): number {
  let score = 0;
  let ch1: string = "a";
  let ch2: string = "b";
  let cnt1 = 0;
  let cnt2 = 0;

  if (x < y) {
    let temp = x;
    x = y;
    y = temp;
    ch1 = "b";
    ch2 = "a";
  }

  for (const ch of s) {
    if (ch === ch1) {
      cnt1++;
    } else if (ch === ch2) {
      if (cnt1 > 0) {
        cnt1--;
        score += x;
      } else {
        cnt2++;
      }
    } else {
      score += Math.min(cnt1, cnt2) * y;
      cnt1 = 0;
      cnt2 = 0;
    }
  }

  if (cnt1 !== 0) {
    score += Math.min(cnt1, cnt2) * y;
  }

  return score;
}
