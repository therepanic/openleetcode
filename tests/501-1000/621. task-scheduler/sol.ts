function leastInterval(tasks: string[], n: number): number {
  const count: Map<string, number> = new Map();
  for (const t of tasks) {
    count.set(t, (count.get(t) || 0) + 1);
  }
  const values = Array.from(count.values());
  const f_max = Math.max(...values);
  const max_count = values.filter((v) => v === f_max).length;
  return Math.max(tasks.length, (f_max - 1) * (n + 1) + max_count);
}
