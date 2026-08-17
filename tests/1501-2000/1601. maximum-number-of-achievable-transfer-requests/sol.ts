function maximumRequests(n: number, requests: number[][]): number {
  let ans = 0;
  const indegree = new Array(n).fill(0);

  const helper = (start: number, count: number): void => {
    if (start === requests.length) {
      let ok = true;
      for (let i = 0; i < n; i++) {
        if (indegree[i] !== 0) {
          ok = false;
          break;
        }
      }
      if (ok && count > ans) ans = count;
      return;
    }

    // Take
    indegree[requests[start][0]]--;
    indegree[requests[start][1]]++;
    helper(start + 1, count + 1);

    // Not-take
    indegree[requests[start][0]]++;
    indegree[requests[start][1]]--;
    helper(start + 1, count);
  };

  helper(0, 0);
  return ans;
}
