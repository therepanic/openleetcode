function checkOverlap(
  radius: number,
  xCenter: number,
  yCenter: number,
  x1: number,
  y1: number,
  x2: number,
  y2: number,
): boolean {
  const nearestX = Math.max(x1, Math.min(x2, xCenter));
  const nearestY = Math.max(y1, Math.min(y2, yCenter));
  const dist = (nearestX - xCenter) ** 2 + (nearestY - yCenter) ** 2;
  return dist <= radius * radius;
}
