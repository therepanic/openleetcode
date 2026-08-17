function countGoodRectangles(rectangles: number[][]): number {
  const maxLen = Math.max(...rectangles.map((r) => Math.min(...r)));
  return rectangles.filter((r) => Math.min(...r) === maxLen).length;
}
