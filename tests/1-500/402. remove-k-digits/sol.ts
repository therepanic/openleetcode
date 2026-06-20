function removeKdigits(num: string, k: number): string {
  const s: string[] = [];
  for (const c of num) {
    while (k > 0 && s.length > 0 && s[s.length - 1] > c) {
      s.pop();
      k--;
    }
    s.push(c);
  }

  s.splice(s.length - k, k);
  const result = s.join("").replace(/^0+/, "");
  return result || "0";
}
