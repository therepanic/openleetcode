function maxDistToClosest(seats: number[]): number {
  const s = seats.join("");
  const parts = s.split("1");
  const maxVal = Math.max(...parts.map((p) => p.length));
  return Math.max(
    parts[0].length,
    Math.floor((maxVal + 1) / 2),
    parts[parts.length - 1].length,
  );
}
