function distanceBetweenBusStops(
  distance: number[],
  start: number,
  destination: number,
): number {
  if (destination < start) {
    [start, destination] = [destination, start];
  }
  let s = 0;
  for (let i = start; i < destination; i++) {
    s += distance[i];
  }
  const total = distance.reduce((a, b) => a + b, 0);
  return Math.min(s, total - s);
}
