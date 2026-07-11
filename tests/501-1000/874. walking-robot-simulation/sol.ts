function robotSim(commands: number[], obstacles: number[][]): number {
  const blocked = new Set<string>();
  for (const o of obstacles) {
    blocked.add(`${o[0]},${o[1]}`);
  }

  const directions = [
    [0, 1],
    [1, 0],
    [0, -1],
    [-1, 0],
  ];

  let x = 0,
    y = 0;
  let dir = 0;
  let maxDist = 0;

  for (const cmd of commands) {
    if (cmd === -1) {
      dir = (dir + 1) % 4;
    } else if (cmd === -2) {
      dir = (dir + 3) % 4;
    } else {
      let steps = cmd;
      while (steps > 0) {
        const nx = x + directions[dir][0];
        const ny = y + directions[dir][1];

        if (blocked.has(`${nx},${ny}`)) {
          break;
        }

        x = nx;
        y = ny;

        maxDist = Math.max(maxDist, x * x + y * y);
        steps--;
      }
    }
  }

  return maxDist;
}
