function numTilePossibilities(tiles: string): number {
  const arr = tiles.split("").sort();
  const used: boolean[] = new Array(arr.length).fill(false);
  return backtrack(arr, used);
}

function backtrack(tiles: string[], used: boolean[]): number {
  let count = 0;
  for (let i = 0; i < tiles.length; i++) {
    if (used[i] || (i > 0 && tiles[i] === tiles[i - 1] && !used[i - 1])) {
      continue;
    }
    used[i] = true;
    count += 1 + backtrack(tiles, used);
    used[i] = false;
  }
  return count;
}
