function maxValue(n: string, x: number): string {
  const xs = x.toString();
  if (n[0] !== "-") {
    for (let i = 0; i < n.length; i++) {
      if (xs > n[i]) {
        return n.slice(0, i) + xs + n.slice(i);
      }
    }
    return n + xs;
  } else {
    for (let i = 1; i < n.length; i++) {
      if (xs < n[i]) {
        return n.slice(0, i) + xs + n.slice(i);
      }
    }
    return n + xs;
  }
}
