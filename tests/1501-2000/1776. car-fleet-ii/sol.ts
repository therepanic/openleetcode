function getCollisionTimes(cars: number[][]): number[] {
  const n = cars.length;
  const rightGreater: number[] = Array(n).fill(-1);
  const ans: number[] = Array(n).fill(-1.0);
  const stack: number[] = [];
  for (let r = n - 1; r >= 0; r--) {
    while (stack.length > 0 && cars[stack[stack.length - 1]][1] >= cars[r][1]) {
      stack.pop();
    }
    if (stack.length > 0) {
      rightGreater[r] = stack[stack.length - 1];
    }
    stack.push(r);
  }
  for (let r = n - 1; r >= 0; r--) {
    let collideId = rightGreater[r];
    while (
      collideId !== -1 &&
      ans[collideId] !== -1 &&
      ans[collideId] <
        (cars[collideId][0] - cars[r][0]) / (cars[r][1] - cars[collideId][1])
    ) {
      collideId = rightGreater[collideId];
    }
    if (collideId !== -1) {
      ans[r] =
        (cars[collideId][0] - cars[r][0]) / (cars[r][1] - cars[collideId][1]);
    }
  }
  return ans;
}
