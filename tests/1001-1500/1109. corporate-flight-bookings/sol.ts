function corpFlightBookings(bookings: number[][], n: number): number[] {
  const l: number[] = new Array(n + 1).fill(0);
  for (const i of bookings) {
    const x = i[0];
    const y = i[1];
    l[x - 1] += i[2];
    l[y] -= i[2];
  }

  const s: number[] = [];
  for (let i = 0; i < n; i++) {
    if (i === 0) {
      s.push(l[i]);
    } else {
      s.push(s[i - 1] + l[i]);
    }
  }
  return s;
}
