function reformat(s: string): string {
  const digits: string[] = [];
  const letters: string[] = [];
  for (const c of s) {
    if (/\d/.test(c)) {
      digits.push(c);
    } else if (/[a-zA-Z]/.test(c)) {
      letters.push(c);
    }
  }
  if (Math.abs(digits.length - letters.length) >= 2) {
    return "";
  }
  const ans: string[] = new Array(s.length);
  if (digits.length > letters.length) {
    for (let i = 0; i < s.length; i++) {
      ans[i] = i % 2 === 0 ? digits[(i / 2) | 0] : letters[(i / 2) | 0];
    }
  } else {
    for (let i = 0; i < s.length; i++) {
      ans[i] = i % 2 === 0 ? letters[(i / 2) | 0] : digits[(i / 2) | 0];
    }
  }
  return ans.join("");
}
