function isPrintable(targetGrid: number[][]): boolean {
  const m = targetGrid.length;
  const n = targetGrid[0].length;
  const colors: Map<number, [number, number][]> = new Map();
  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      if (!colors.has(targetGrid[i][j])) colors.set(targetGrid[i][j], []);
      colors.get(targetGrid[i][j])!.push([i, j]);
    }
  }

  function canRemove(color: number): boolean {
    const pos = colors.get(color)!;
    let mnR = pos[0][0],
      mxR = pos[0][0];
    let mnC = pos[0][1],
      mxC = pos[0][1];
    for (const [r, c] of pos) {
      mnR = Math.min(mnR, r);
      mxR = Math.max(mxR, r);
      mnC = Math.min(mnC, c);
      mxC = Math.max(mxC, c);
    }
    for (let i = mnR; i <= mxR; i++) {
      for (let j = mnC; j <= mxC; j++) {
        if (targetGrid[i][j] !== color && targetGrid[i][j] > 0) return false;
      }
    }
    for (let i = mnR; i <= mxR; i++) {
      for (let j = mnC; j <= mxC; j++) {
        targetGrid[i][j] = 0;
      }
    }
    return true;
  }

  const colorSet = new Set(colors.keys());
  while (colorSet.size > 0) {
    const removable = new Set<number>();
    for (const c of colorSet) {
      if (canRemove(c)) removable.add(c);
    }
    if (removable.size === 0) return false;
    removable.forEach((c) => colorSet.delete(c));
  }
  return true;
}
