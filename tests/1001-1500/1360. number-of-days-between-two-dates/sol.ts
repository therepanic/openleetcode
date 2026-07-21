function daysBetweenDates(date1: string, date2: string): number {
  const [y1, m1, d1] = date1.split("-").map(Number);
  const [y2, m2, d2] = date2.split("-").map(Number);
  return Math.abs(daysSince1970(y1, m1, d1) - daysSince1970(y2, m2, d2));
}

function daysSince1970(y: number, m: number, d: number): number {
  if (m < 3) {
    y--;
    m += 12;
  }
  return (
    365 * y +
    Math.floor(y / 4) -
    Math.floor(y / 100) +
    Math.floor(y / 400) +
    Math.floor((153 * m - 457) / 5) +
    d -
    306 -
    719468
  );
}
