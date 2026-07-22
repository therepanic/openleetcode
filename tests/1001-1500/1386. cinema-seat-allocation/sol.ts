function maxNumberOfFamilies(n: number, reservedSeats: number[][]): number {
  const rowSeats: Map<number, Set<number>> = new Map();

  for (const [row, seat] of reservedSeats) {
    if (!rowSeats.has(row)) {
      rowSeats.set(row, new Set());
    }
    rowSeats.get(row)!.add(seat);
  }

  let ans = (n - rowSeats.size) * 2;

  const option1 = new Set([2, 3, 4, 5]);
  const option2 = new Set([6, 7, 8, 9]);
  const option3 = new Set([4, 5, 6, 7]);

  for (const seats of rowSeats.values()) {
    let available = 0;
    if (![...option1].some((s) => seats.has(s))) {
      available += 1;
    }
    if (![...option2].some((s) => seats.has(s))) {
      available += 1;
    }
    if (![...option3].some((s) => seats.has(s))) {
      available = Math.max(available, 1);
    }
    ans += available;
  }

  return ans;
}
