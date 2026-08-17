function maxDistance(position: number[], m: number): number {
  position.sort((a, b) => a - b);
  let right = position[position.length - 1] - position[0];
  let left = 1;

  while (left <= right) {
    const mid = Math.floor((left + right) / 2);
    let myBalls = 1;
    let previous = position[0];

    for (let i = 1; i < position.length; i++) {
      if (position[i] - previous >= mid) {
        myBalls++;
        previous = position[i];
      }
    }

    if (myBalls >= m) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }

  return right;
}
