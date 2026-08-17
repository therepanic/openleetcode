function maximizeXor(nums: number[], queries: number[][]): number[] {
  const trie: number[][] = [[-1, -1]];
  const insert = (num: number) => {
    let node = 0;
    for (let i = 31; i >= 0; --i) {
      const bit = (num >> i) & 1;
      if (trie[node][bit] === -1) {
        trie[node][bit] = trie.length;
        trie.push([-1, -1]);
      }
      node = trie[node][bit];
    }
  };
  const maxor = (num: number): number => {
    if (trie[0][0] === -1 && trie[0][1] === -1) return -1;
    let node = 0;
    let ans = 0;
    for (let i = 31; i >= 0; --i) {
      const bit = (num >> i) & 1;
      const opp = 1 - bit;
      if (trie[node][opp] !== -1) {
        ans |= 1 << i;
        node = trie[node][opp];
      } else {
        node = trie[node][bit];
      }
    }
    return ans;
  };

  nums.sort((a, b) => a - b);
  const q: number[][] = [];
  for (let i = 0; i < queries.length; ++i) {
    q.push([queries[i][1], queries[i][0], i]);
  }
  q.sort((a, b) => a[0] - b[0]);
  const res: number[] = new Array(queries.length).fill(-1);
  let idx = 0;
  const n = nums.length;
  for (const [m, x, i] of q) {
    while (idx < n && nums[idx] <= m) {
      insert(nums[idx]);
      idx++;
    }
    res[i] = maxor(x);
  }
  return res;
}
