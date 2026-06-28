function openLock(deadends: string[], target: string): number {
  if (target === "0000") return 0;
  const dead = new Set(deadends);
  if (dead.has("0000")) return -1;

  let moves = 0;
  const queue: string[] = ["0000"];
  const visited = new Set<string>(["0000"]);

  while (queue.length > 0) {
    const size = queue.length;
    for (let k = 0; k < size; k++) {
      const cur = queue.shift()!;
      if (cur === target) return moves;

      for (let i = 0; i < 4; i++) {
        const val = parseInt(cur[i]);
        const up = (val + 1) % 10;
        const down = (val - 1 + 10) % 10;

        const nxt1 = cur.substring(0, i) + up + cur.substring(i + 1);
        const nxt2 = cur.substring(0, i) + down + cur.substring(i + 1);

        if (!dead.has(nxt1) && !visited.has(nxt1)) {
          visited.add(nxt1);
          queue.push(nxt1);
        }
        if (!dead.has(nxt2) && !visited.has(nxt2)) {
          visited.add(nxt2);
          queue.push(nxt2);
        }
      }
    }
    moves++;
  }
  return -1;
}
