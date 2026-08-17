function maxHappyGroups(batchSize: number, groups: number[]): number {
  let counts: number[] = new Array(batchSize).fill(0);
  let happyCount = 0;
  for (let g of groups) {
    let rem = g % batchSize;
    if (rem === 0) {
      happyCount++;
    } else {
      counts[rem]++;
    }
  }

  for (let i = 1; i <= Math.floor(batchSize / 2); i++) {
    if (i === batchSize - i) {
      let pairCount = Math.floor(counts[i] / 2);
      happyCount += pairCount;
      counts[i] %= 2;
    } else {
      let pairCount = Math.min(counts[i], counts[batchSize - i]);
      happyCount += pairCount;
      counts[i] -= pairCount;
      counts[batchSize - i] -= pairCount;
    }
  }

  let state = counts.slice(1);
  let memo = new Map<string, number>();
  return happyCount + viterbi(state, 0, batchSize, memo);
}

function viterbi(
  counts: number[],
  leftover: number,
  batchSize: number,
  memo: Map<string, number>,
): number {
  let key = counts.join(",") + "," + leftover.toString();
  if (memo.has(key)) return memo.get(key)!;

  let sum = counts.reduce((a, b) => a + b, 0);
  if (sum === 0) {
    memo.set(key, 0);
    return 0;
  }

  let res = 0;
  for (let i = 0; i < counts.length; i++) {
    if (counts[i] > 0) {
      let rem = i + 1;
      let next = [...counts];
      next[i]--;

      let isHappy = leftover === 0 ? 1 : 0;
      let newLeftover = (leftover + rem) % batchSize;

      let val = isHappy + viterbi(next, newLeftover, batchSize, memo);
      if (val > res) res = val;
    }
  }
  memo.set(key, res);
  return res;
}
