function averageWaitingTime(customers: number[][]): number {
  let waiting = 0;
  let current = 0;
  for (const [arrival, time] of customers) {
    if (current <= arrival) {
      current = arrival + time;
      waiting += time;
    } else {
      current += time;
      waiting += current - arrival;
    }
  }
  return waiting / customers.length;
}
