function minimumTimeRequired(jobs: number[], k: number): number {
  jobs.sort((a, b) => b - a);
  let left = jobs[0];
  let right = jobs.reduce((sum, j) => sum + j, 0);

  function canDistribute(maxWorkload: number): boolean {
    const workers = new Array(k).fill(0);

    function assignJob(jobIndex: number): boolean {
      if (jobIndex === jobs.length) return true;
      for (let i = 0; i < k; i++) {
        if (workers[i] + jobs[jobIndex] <= maxWorkload) {
          workers[i] += jobs[jobIndex];
          if (assignJob(jobIndex + 1)) return true;
          workers[i] -= jobs[jobIndex];
        }
        if (workers[i] === 0) break;
      }
      return false;
    }

    return assignJob(0);
  }

  while (left < right) {
    const mid = Math.floor((left + right) / 2);
    if (canDistribute(mid)) {
      right = mid;
    } else {
      left = mid + 1;
    }
  }
  return left;
}
