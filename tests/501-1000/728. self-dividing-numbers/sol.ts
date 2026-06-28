function selfDividingNumbers(left: number, right: number): number[] {
  const lst: number[] = [];
  for (let i = left; i <= right; i++) {
    const s = i.toString();
    if (s.includes("0")) continue;
    let b = 1;
    for (const ch of s) {
      const digit = parseInt(ch);
      if (i % digit !== 0) {
        b = 0;
        break;
      }
    }
    if (b === 1) lst.push(i);
  }
  return lst;
}
