function mergeTriplets(triplets: number[][], target: number[]): boolean {
  for (const t of triplets) {
    if (t[0] === target[0] && t[1] === target[1] && t[2] === target[2]) {
      return true;
    }
  }
  let curr = [0, 0, 0];
  for (const t of triplets) {
    let flag = false;
    if (target[0] === t[0] && curr[0] !== target[0]) {
      flag = true;
    }
    if (target[1] === t[1] && curr[1] !== target[1]) {
      flag = true;
    }
    if (target[2] === t[2] && curr[2] !== target[2]) {
      flag = true;
    }
    if (flag) {
      const temp = [...curr];
      curr = [
        Math.max(curr[0], t[0]),
        Math.max(curr[1], t[1]),
        Math.max(curr[2], t[2]),
      ];
      if (curr[0] > target[0] || curr[1] > target[1] || curr[2] > target[2]) {
        curr = temp;
      }
    }
  }
  return (
    curr[0] === target[0] && curr[1] === target[1] && curr[2] === target[2]
  );
}
