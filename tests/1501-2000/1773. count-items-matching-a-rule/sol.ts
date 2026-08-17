function countMatches(
  items: string[][],
  ruleKey: string,
  ruleValue: string,
): number {
  const keyMap: { [key: string]: number } = { type: 0, color: 1, name: 2 };
  let count = 0;
  const idx = keyMap[ruleKey];
  for (const item of items) {
    if (item[idx] === ruleValue) {
      count++;
    }
  }
  return count;
}
