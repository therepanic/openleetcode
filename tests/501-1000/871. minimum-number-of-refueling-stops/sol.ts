function minRefuelStops(
  target: number,
  startFuel: number,
  stations: number[][],
): number {
  let fuel = startFuel;
  let count = 0;
  const heap: number[] = [];
  stations.push([target, 0]);
  let i = 0;
  while (i < stations.length) {
    if (fuel >= target) return count;
    while (i < stations.length && stations[i][0] <= fuel) {
      heap.push(stations[i][1]);
      heap.sort((a, b) => b - a);
      i++;
    }
    if (heap.length === 0) return -1;
    fuel += heap.shift()!;
    count++;
  }
  return -1;
}
