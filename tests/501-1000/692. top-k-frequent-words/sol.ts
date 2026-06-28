function topKFrequent(words: string[], k: number): string[] {
  const counter = new Map<string, number>();
  for (const w of words) {
    counter.set(w, (counter.get(w) || 0) + 1);
  }
  const heap: [number, string][] = [];
  for (const [w, f] of counter) {
    heap.push([-f, w]);
  }
  heap.sort((a, b) => (a[0] === b[0] ? a[1].localeCompare(b[1]) : a[0] - b[0]));
  return heap.slice(0, k).map(([, w]) => w);
}
