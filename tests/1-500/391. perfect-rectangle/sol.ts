function isRectangleCover(rectangles: number[][]): boolean {
  let area = 0;
  const corners = new Set<string>();

  for (const rect of rectangles) {
    const [x, y, X, Y] = rect;
    area += (X - x) * (Y - y);

    const p1 = `${x},${y}`;
    const p2 = `${x},${Y}`;
    const p3 = `${X},${y}`;
    const p4 = `${X},${Y}`;

    if (!corners.has(p1)) corners.add(p1);
    else corners.delete(p1);
    if (!corners.has(p2)) corners.add(p2);
    else corners.delete(p2);
    if (!corners.has(p3)) corners.add(p3);
    else corners.delete(p3);
    if (!corners.has(p4)) corners.add(p4);
    else corners.delete(p4);
  }

  if (corners.size !== 4) return false;

  let minX = Infinity,
    minY = Infinity;
  let maxX = -Infinity,
    maxY = -Infinity;

  for (const point of corners) {
    const [x, y] = point.split(",").map(Number);
    minX = Math.min(minX, x);
    minY = Math.min(minY, y);
    maxX = Math.max(maxX, x);
    maxY = Math.max(maxY, y);
  }

  return (maxX - minX) * (maxY - minY) === area;
}
