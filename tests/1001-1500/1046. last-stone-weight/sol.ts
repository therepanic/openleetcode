function lastStoneWeight(stones: number[]): number {
  const arr = stones.slice();
  while (arr.length > 1) {
    arr.sort((a, b) => b - a);
    const maxStone1 = arr.shift()!;
    const maxStone2 = arr.shift()!;
    if (maxStone1 !== maxStone2) {
      arr.push(maxStone1 - maxStone2);
    }
  }
  return arr.length === 0 ? 0 : arr[0];
}
