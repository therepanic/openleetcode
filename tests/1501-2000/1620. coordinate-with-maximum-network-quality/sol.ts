function bestCoordinate(towers: number[][], radius: number): number[] {
  let maxX = 0;
  let maxY = 0;
  for (const t of towers) {
    maxX = Math.max(maxX, t[0]);
    maxY = Math.max(maxY, t[1]);
  }

  let bestQuality = 0;
  let bestCoord = [0, 0];

  for (let x = 0; x <= maxX; x++) {
    for (let y = 0; y <= maxY; y++) {
      let quality = 0;
      for (const t of towers) {
        const dist = Math.sqrt(Math.pow(t[0] - x, 2) + Math.pow(t[1] - y, 2));
        if (dist <= radius) {
          quality += Math.floor(t[2] / (1 + dist));
        }
      }
      if (
        quality > bestQuality ||
        (quality === bestQuality &&
          (x < bestCoord[0] || (x === bestCoord[0] && y < bestCoord[1])))
      ) {
        bestQuality = quality;
        bestCoord[0] = x;
        bestCoord[1] = y;
      }
    }
  }

  return bestCoord;
}
