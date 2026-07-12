function isValid(s: string): boolean {
  if (s === "abc") {
    return true;
  }
  if (s[0] !== "a" || s[s.length - 1] !== "c") {
    return false;
  }
  let l = s.split("");
  for (let j = 0; j < l.length; j++) {
    let i = 0;
    while (i <= l.length - 3) {
      if (l.length === 3 && l[0] === "a" && l[1] === "b" && l[2] === "c") {
        return true;
      }
      if (i + 2 <= l.length - 1) {
        if (l[i] === "a" && l[i + 1] === "b" && l[i + 2] === "c") {
          l.splice(i, 3);
          i = -1;
        }
      }
      i++;
    }
  }
  if (l.length === 0) {
    return true;
  }
  return false;
}
