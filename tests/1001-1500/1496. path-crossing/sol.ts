function isPathCrossing(path: string): boolean {
  const set = new Set<string>();
  let x = 0,
    y = 0;
  set.add("0,0");
  for (const c of path) {
    if (c === "N") y++;
    else if (c === "S") y--;
    else if (c === "E") x++;
    else if (c === "W") x--;
    const point = `${x},${y}`;
    if (set.has(point)) return true;
    set.add(point);
  }
  return false;
}
