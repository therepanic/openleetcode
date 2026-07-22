function checkStraightLine(coordinates: number[][]): boolean {
  let x1 = coordinates[0][0];
  let y1 = coordinates[0][1];
  let x2 = coordinates[1][0];
  let y2 = coordinates[1][1];

  let slope: number;
  if (x2 === x1) {
    slope = Infinity;
  } else {
    slope = (y2 - y1) / (x2 - x1);
  }

  const n = coordinates.length;
  for (let i = 1; i < n - 1; i++) {
    x1 = coordinates[i][0];
    y1 = coordinates[i][1];
    x2 = coordinates[i + 1][0];
    y2 = coordinates[i + 1][1];

    let currSlope: number;
    if (x2 === x1) {
      currSlope = Infinity;
    } else {
      currSlope = (y2 - y1) / (x2 - x1);
    }

    if (currSlope !== slope) {
      return false;
    }
  }

  return true;
}
