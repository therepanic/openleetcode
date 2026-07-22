function maxEvents(events: number[][]): number {
  events.sort((a, b) => a[1] - b[1] || a[0] - b[0]);
  const maxDay = Math.max(...events.map((event) => event[1]));
  const parent = Array.from({ length: maxDay + 2 }, (_, day) => day);
  const find = (day: number): number =>
    parent[day] === day ? day : (parent[day] = find(parent[day]));
  let result = 0;
  for (const [start, end] of events) {
    const day = find(start);
    if (day <= end) {
      result++;
      parent[day] = find(day + 1);
    }
  }
  return result;
}
