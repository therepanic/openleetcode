function minStickers(stickers: string[], target: string): number {
  const memo = new Map<string, number>();

  function dfs(idx: number, target: string): number {
    if (target === "") return 0;
    if (idx === stickers.length) return Infinity;

    const key = `${idx},${target}`;
    if (memo.has(key)) return memo.get(key)!;

    let result = dfs(idx + 1, target);

    const currentSticker = stickers[idx];
    let newTarget = target;
    let somethingRemoved = false;
    for (const c of currentSticker) {
      const idxToRemove = newTarget.indexOf(c);
      if (idxToRemove !== -1) {
        newTarget =
          newTarget.slice(0, idxToRemove) + newTarget.slice(idxToRemove + 1);
        somethingRemoved = true;
      }
    }

    if (somethingRemoved) {
      result = Math.min(result, 1 + dfs(idx, newTarget));
    }

    memo.set(key, result);
    return result;
  }

  const result = dfs(0, target);
  return result === Infinity ? -1 : result;
}
