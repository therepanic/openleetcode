function smallestChair(times: number[][], targetFriend: number): number {
  const target_time = times[targetFriend];
  times.sort((a, b) => a[0] - b[0]);

  const n = times.length;
  const chair_time = new Array(n).fill(0);

  for (const time of times) {
    for (let i = 0; i < n; i++) {
      if (chair_time[i] <= time[0]) {
        chair_time[i] = time[1];
        if (time[0] === target_time[0] && time[1] === target_time[1]) {
          return i;
        }
        break;
      }
    }
  }

  return 0;
}
