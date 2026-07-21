function getHappyString(n: number, k: number): string {
  const total = 3 * (1 << (n - 1));
  if (k > total) {
    return "";
  }

  k -= 1;
  let result = "";
  let last = "";

  for (let pos = 0; pos < n; pos++) {
    const branch = 1 << (n - pos - 1);
    const choices: string[] = [];
    for (const c of ["a", "b", "c"]) {
      if (c !== last) {
        choices.push(c);
      }
    }

    const idx = Math.floor(k / branch);
    result += choices[idx];

    last = choices[idx];
    k %= branch;
  }

  return result;
}
