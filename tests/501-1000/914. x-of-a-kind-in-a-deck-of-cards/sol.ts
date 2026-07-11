function hasGroupsSizeX(deck: number[]): boolean {
  const counts: Map<number, number> = new Map();
  for (const card of deck) {
    counts.set(card, (counts.get(card) || 0) + 1);
  }

  function getGcd(a: number, b: number): number {
    while (b > 0) {
      const temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }

  const frequencies = Array.from(counts.values());
  let currentGcd = frequencies[0];

  for (let i = 1; i < frequencies.length; i++) {
    currentGcd = getGcd(currentGcd, frequencies[i]);
    if (currentGcd === 1) {
      return false;
    }
  }

  return currentGcd >= 2;
}
