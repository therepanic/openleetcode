function numPoints(darts: number[][], r: number): number {
  let ans = 1;
  const radius = r;
  const radiusSq = radius * radius;
  for (let i = 0; i < darts.length; i++) {
    const [x1, y1] = darts[i];
    for (let j = i + 1; j < darts.length; j++) {
      const [x2, y2] = darts[j];
      const dx = x2 - x1;
      const dy = y2 - y1;
      const distanceSq = dx * dx + dy * dy;
      if (distanceSq > 4 * radiusSq) continue;
      const distance = Math.sqrt(distanceSq);
      const midpointX = (x1 + x2) / 2;
      const midpointY = (y1 + y2) / 2;
      const offset = Math.sqrt(Math.max(0, radiusSq - distanceSq / 4));
      const normalX = -dy / distance;
      const normalY = dx / distance;
      for (const sign of [-1, 1]) {
        const centerX = midpointX + sign * offset * normalX;
        const centerY = midpointY + sign * offset * normalY;
        let count = 0;
        for (const [x, y] of darts) {
          const ex = x - centerX;
          const ey = y - centerY;
          if (ex * ex + ey * ey <= radiusSq + 1e-9) count++;
        }
        ans = Math.max(ans, count);
      }
    }
  }
  return ans;
}
