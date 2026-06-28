function asteroidCollision(asteroids: number[]): number[] {
  const res: number[] = [];
  for (const a of asteroids) {
    let destroyed = false;
    while (res.length > 0 && a < 0 && res[res.length - 1] > 0) {
      if (-a > res[res.length - 1]) {
        res.pop();
        continue;
      } else if (-a === res[res.length - 1]) {
        res.pop();
      }
      destroyed = true;
      break;
    }
    if (!destroyed) {
      res.push(a);
    }
  }
  return res;
}
