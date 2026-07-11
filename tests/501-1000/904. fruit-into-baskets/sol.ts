function totalFruit(fruits: number[]): number {
  let start = 0;
  let maxLen = 0;
  const fruitCount = new Map<number, number>();

  for (let end = 0; end < fruits.length; end++) {
    fruitCount.set(fruits[end], (fruitCount.get(fruits[end]) ?? 0) + 1);

    while (fruitCount.size > 2) {
      const leftFruit = fruits[start];
      fruitCount.set(leftFruit, fruitCount.get(leftFruit)! - 1);
      if (fruitCount.get(leftFruit) === 0) {
        fruitCount.delete(leftFruit);
      }
      start++;
    }

    maxLen = Math.max(maxLen, end - start + 1);
  }

  return maxLen;
}
