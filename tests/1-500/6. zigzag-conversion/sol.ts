function convert(s: string, numRows: number): string {
  if (numRows === 1 || numRows >= s.length) {
    return s;
  }

  const rows = Array.from({ length: numRows }, () => "");
  let idx = 0;
  let step = 1;

  for (let i = 0; i < s.length; i++) {
    rows[idx] += s[i];
    if (idx === 0) {
      step = 1;
    } else if (idx === numRows - 1) {
      step = -1;
    }
    idx += step;
  }

  return rows.join("");
}
