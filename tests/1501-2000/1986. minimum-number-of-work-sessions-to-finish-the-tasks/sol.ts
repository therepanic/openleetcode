function minSessions(tasks: number[], sessionTime: number): number {
  tasks.sort((a, b) => b - a);

  function feasibility(n: number): boolean {
    const sessions = new Array(n).fill(0);

    function dfs(i: number): boolean {
      for (const v of sessions) {
        if (v > sessionTime) return false;
      }
      if (i === tasks.length) return true;

      for (let s = 0; s < n; s++) {
        sessions[s] += tasks[i];
        if (dfs(i + 1)) return true;
        sessions[s] -= tasks[i];
        if (sessions[s] === 0) return false;
      }
      return false;
    }

    return dfs(0);
  }

  let lo = 1,
    hi = tasks.length;
  let res = hi;
  while (lo <= hi) {
    const mid = Math.floor((lo + hi) / 2);
    if (feasibility(mid)) {
      res = mid;
      hi = mid - 1;
    } else {
      lo = mid + 1;
    }
  }
  return res;
}
