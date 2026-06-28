function countAndSay(n: number): string {
  let current = "1";
  for (let step = 1; step < n; step++) {
    let next = "";
    for (let i = 0; i < current.length;) {
      let j = i;
      while (j < current.length && current[j] === current[i]) {
        j++;
      }
      next += String(j - i) + current[i];
      i = j;
    }
    current = next;
  }
  return current;
}
