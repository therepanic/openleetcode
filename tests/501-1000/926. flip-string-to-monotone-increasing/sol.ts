function minFlipsMonoIncr(s: string): number {
  let zeroes = 0;
  let ones = 0;

  for (const ch of s) {
    if (ch === "0") {
      zeroes++;
    }
  }

  let output = zeroes;

  for (const ch of s) {
    if (ch === "0") {
      zeroes--;
    } else if (ch === "1") {
      ones++;
    }
    output = Math.min(output, zeroes + ones);
  }

  return output;
}
