function validSquare(
  p1: number[],
  p2: number[],
  p3: number[],
  p4: number[],
): boolean {
  const getDistSq = (pt1: number[], pt2: number[]): number => {
    return (pt1[0] - pt2[0]) ** 2 + (pt1[1] - pt2[1]) ** 2;
  };

  const points = [p1, p2, p3, p4];
  const distances = new Set<number>();

  for (let i = 0; i < 4; i++) {
    for (let j = i + 1; j < 4; j++) {
      distances.add(getDistSq(points[i], points[j]));
    }
  }

  return distances.size === 2 && !distances.has(0);
}
