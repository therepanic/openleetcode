function minNumberOfFrogs(croakOfFrogs: string): number {
  let maxi = 0;
  let curr = 0;
  let c = 0,
    r = 0,
    o = 0,
    a = 0,
    k = 0;
  for (const char of croakOfFrogs) {
    if (char === "c") {
      c++;
      curr++;
    } else if (char === "r") {
      r++;
    } else if (char === "o") {
      o++;
    } else if (char === "a") {
      a++;
    } else if (char === "k") {
      k++;
      curr--;
    }
    maxi = Math.max(maxi, curr);
    if (c < r || r < o || o < a || a < k) {
      return -1;
    }
  }
  if (curr === 0 && c === r && r === o && o === a && a === k) {
    return maxi;
  } else {
    return -1;
  }
}
