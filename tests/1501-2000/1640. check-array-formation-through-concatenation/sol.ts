function canFormArray(arr: number[], pieces: number[][]): boolean {
  let a: number[] = [];
  let remaining = [...pieces];
  for (let i of arr) {
    for (let j = 0; j < remaining.length; j++) {
      if (remaining[j].includes(i)) {
        a.push(...remaining[j]);
        remaining.splice(j, 1);
        break;
      }
    }
  }
  return a.length === arr.length && a.every((v, idx) => v === arr[idx]);
}
