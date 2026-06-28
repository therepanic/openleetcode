function leastBricks(wall: number[][]): number {
  const edgeCounts: Map<number, number> = new Map();
  for (const row of wall) {
    let edge = 0;
    for (let i = 0; i < row.length - 1; i++) {
      edge += row[i];
      edgeCounts.set(edge, (edgeCounts.get(edge) || 0) + 1);
    }
  }
  let maxEdges = 0;
  for (const count of edgeCounts.values()) {
    maxEdges = Math.max(maxEdges, count);
  }
  return wall.length - maxEdges;
}
