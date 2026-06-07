function numDecodings(s: string): number {
  if (s.length === 0 || s[0] === "0") {
    return 0;
  }

  let prev2 = 1;
  let prev1 = 1;
  for (let i = 1; i < s.length; i++) {
    let curr = 0;
    if (s[i] !== "0") {
      curr += prev1;
    }
    const value = Number(s.slice(i - 1, i + 1));
    if (value >= 10 && value <= 26) {
      curr += prev2;
    }
    prev2 = prev1;
    prev1 = curr;
  }

  return prev1;
}
