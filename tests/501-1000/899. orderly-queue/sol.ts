function orderlyQueue(s: string, k: number): string {
  if (k > 1) {
    return s.split("").sort().join("");
  }

  let res: string = s;
  for (let i = 0; i < s.length; i++) {
    s = s.substring(1) + s[0];
    if (s < res) {
      res = s;
    }
  }

  return res;
}
