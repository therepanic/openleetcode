function eliminateMaximum(dist: number[], speed: number[]): number {
  const arrival: number[] = [];
  for (let i = 0; i < dist.length; i++) {
    arrival.push(Math.ceil(dist[i] / speed[i]));
  }
  arrival.sort((a, b) => a - b);
  for (let minute = 0; minute < arrival.length; minute++) {
    if (arrival[minute] <= minute) {
      return minute;
    }
  }
  return arrival.length;
}
