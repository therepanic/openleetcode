function isAlienSorted(words: string[], order: string): boolean {
  const orderMap: Map<string, number> = new Map();
  for (let i = 0; i < order.length; i++) {
    orderMap.set(order[i], i);
  }

  for (let i = 0; i < words.length - 1; i++) {
    const w1 = words[i];
    const w2 = words[i + 1];

    const minLen = Math.min(w1.length, w2.length);
    let j = 0;
    for (j = 0; j < minLen; j++) {
      if (w1[j] !== w2[j]) {
        if (orderMap.get(w1[j])! > orderMap.get(w2[j])!) {
          return false;
        }
        break;
      }
    }
    if (j === minLen && w1.length > w2.length) {
      return false;
    }
  }

  return true;
}
