function camelMatch(queries: string[], pattern: string): boolean[] {
  const ans: boolean[] = [];
  for (const query of queries) {
    let j = 0;
    let i = 0;
    while (i < query.length) {
      if (
        query[i] === query[i].toUpperCase() &&
        query[i] !== query[i].toLowerCase() &&
        ((j < pattern.length && query[i] !== pattern[j]) ||
          j > pattern.length - 1)
      ) {
        break;
      }
      if (j < pattern.length && query[i] === pattern[j]) {
        j++;
      }
      i++;
    }
    if (i === query.length && j === pattern.length) {
      ans.push(true);
    } else {
      ans.push(false);
    }
  }
  return ans;
}
