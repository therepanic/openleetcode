function findMaximumXOR(nums: number[]): number {
  let maxNum = 0;
  for (const num of nums) {
    if (num > maxNum) {
      maxNum = num;
    }
  }
  const mxBit = maxNum.toString(2).length;

  const trie: number[][] = [[-1, -1]];

  function insert(num: number): void {
    let node = 0;
    for (let i = mxBit - 1; i >= 0; i--) {
      const bit = (num >> i) & 1;
      if (trie[node][bit] === -1) {
        trie[node][bit] = trie.length;
        trie.push([-1, -1]);
      }
      node = trie[node][bit];
    }
  }

  function getMax(num: number): number {
    let node = 0;
    let ans = 0;
    for (let i = mxBit - 1; i >= 0; i--) {
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
  }

  for (const num of nums) {
    insert(num);
  }

  let res = 0;
  for (const num of nums) {
    res = Math.max(res, getMax(num));
  }

  return res;
}
