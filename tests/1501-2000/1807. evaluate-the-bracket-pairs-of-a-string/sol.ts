function evaluate(s: string, knowledge: string[][]): string {
  const mp = new Map<string, string>();
  for (const pair of knowledge) {
    mp.set(pair[0], pair[1]);
  }
  let ans = "";
  let i = 0;
  const n = s.length;
  while (i < n) {
    if (s[i] === "(") {
      i++;
      let temp = "";
      while (i < n && s[i] !== ")") {
        temp += s[i];
        i++;
      }
      ans += mp.get(temp) ?? "?";
      i++;
    } else {
      ans += s[i];
      i++;
    }
  }
  return ans;
}
