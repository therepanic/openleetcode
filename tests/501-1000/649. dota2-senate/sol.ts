function predictPartyVictory(senate: string): string {
  const r: number[] = [];
  const d: number[] = [];
  const n = senate.length;

  for (let i = 0; i < n; i++) {
    if (senate[i] === "R") {
      r.push(i);
    } else {
      d.push(i);
    }
  }

  while (r.length > 0 && d.length > 0) {
    const rIdx = r.shift()!;
    const dIdx = d.shift()!;

    if (rIdx < dIdx) {
      r.push(rIdx + n);
    } else {
      d.push(dIdx + n);
    }
  }

  return r.length > 0 ? "Radiant" : "Dire";
}
