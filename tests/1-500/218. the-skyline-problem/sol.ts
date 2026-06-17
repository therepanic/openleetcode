function getSkyline(buildings: number[][]): number[][] {
  const events: [number, number][] = [];
  for (const [L, R, H] of buildings) {
    events.push([L, -H]);
    events.push([R, H]);
  }
  events.sort((a, b) => {
    if (a[0] !== b[0]) return a[0] - b[0];
    return a[1] - b[1];
  });

  const result: number[][] = [];
  const liveBuildings: number[] = [0]; // max heap using negative values
  const pastBuildings: Map<number, number> = new Map();
  let prevMax = 0;

  for (const [x, h] of events) {
    if (h < 0) {
      // insert and sort to maintain max heap order
      liveBuildings.push(-h);
      liveBuildings.sort((a, b) => b - a);
    } else {
      pastBuildings.set(h, (pastBuildings.get(h) || 0) + 1);
    }

    while (liveBuildings.length > 0 && pastBuildings.has(liveBuildings[0])) {
      const top = liveBuildings.shift()!;
      pastBuildings.set(top, pastBuildings.get(top)! - 1);
      if (pastBuildings.get(top) === 0) {
        pastBuildings.delete(top);
      }
    }

    const currMax = liveBuildings[0];
    if (currMax !== prevMax) {
      result.push([x, currMax]);
      prevMax = currMax;
    }
  }

  return result;
}
