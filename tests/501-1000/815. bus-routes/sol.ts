function numBusesToDestination(
  routes: number[][],
  source: number,
  target: number,
): number {
  if (source === target) return 0;
  const adj: Map<number, Set<number>> = new Map();
  for (let bus = 0; bus < routes.length; bus++) {
    for (const location of routes[bus]) {
      if (!adj.has(location)) adj.set(location, new Set());
      adj.get(location)!.add(bus);
    }
  }
  const queue: number[] = Array.from(adj.get(target) ?? []);
  let cost = 0;
  const visited: Set<number> = new Set();
  while (queue.length > 0) {
    cost++;
    const size = queue.length;
    for (let i = 0; i < size; i++) {
      const node = queue.shift()!;
      visited.add(node);
      if (routes[node].includes(source)) return cost;
      for (const location of routes[node]) {
        for (const bus of adj.get(location) ?? []) {
          if (!visited.has(bus)) {
            queue.push(bus);
          }
        }
      }
    }
  }
  return -1;
}
