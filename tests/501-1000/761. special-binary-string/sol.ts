function makeLargestSpecial(s: string): string {
  let count = 0;
  let i = 0;
  const res: string[] = [];

  for (let j = 0; j < s.length; j++) {
    count += s[j] === "1" ? 1 : -1;

    if (count === 0) {
      res.push("1" + makeLargestSpecial(s.substring(i + 1, j)) + "0");
      i = j + 1;
    }
  }

  res.sort((a, b) => b.localeCompare(a));
  return res.join("");
}
