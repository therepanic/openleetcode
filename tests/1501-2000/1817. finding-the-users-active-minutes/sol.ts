function findingUsersActiveMinutes(logs: number[][], k: number): number[] {
  const mp = new Map<number, Set<number>>();
  for (const [user, minute] of logs) {
    if (!mp.has(user)) {
      mp.set(user, new Set());
    }
    mp.get(user)!.add(minute);
  }
  const ans = new Array(k).fill(0);
  for (const set of mp.values()) {
    const size = set.size;
    if (size <= k) {
      ans[size - 1]++;
    }
  }
  return ans;
}
