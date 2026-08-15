function thousandSeparator(n: number): string {
  const s = n.toString();
  if (s.length <= 3) return s;
  let result = "";
  let count = 0;
  for (let i = s.length - 1; i >= 0; i--) {
    result += s[i];
    count++;
    if (count % 3 === 0 && i > 0) {
      result += ".";
    }
  }
  return result.split("").reverse().join("");
}
