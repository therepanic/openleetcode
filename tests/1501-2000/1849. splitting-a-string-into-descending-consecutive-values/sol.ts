function splitString(s: string): boolean {
  function dfs(index: number, prev: number, count: number): boolean {
    if (index === s.length) {
      return count >= 2;
    }

    let curr = 0;
    for (let i = index; i < s.length; i++) {
      curr = curr * 10 + (s.charCodeAt(i) - 48);
      if (prev === -1 || prev - curr === 1) {
        if (dfs(i + 1, curr, count + 1)) {
          return true;
        }
      } else if (curr >= prev && prev !== -1) {
        break;
      }
    }
    return false;
  }

  return dfs(0, -1, 0);
}
