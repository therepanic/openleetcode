function canMeasureWater(x: number, y: number, target: number): boolean {
  if (target > x + y) return false;
  const stack: [number, number][] = [[0, 0]];
  const visited = new Set<string>();
  while (stack.length > 0) {
    const [a, b] = stack.pop()!;
    if (a + b === target) return true;
    const key = `${a},${b}`;
    if (visited.has(key)) continue;
    visited.add(key);
    stack.push([x, b], [a, y], [0, b], [a, 0]);
    const w = Math.min(a, y - b);
    stack.push([a - w, b + w]);
    const w2 = Math.min(b, x - a);
    stack.push([a + w2, b - w2]);
  }
  return false;
}
