function reorganizeString(s: string): string {
  const charFreq: Map<string, number> = new Map();
  for (const c of s) {
    charFreq.set(c, (charFreq.get(c) || 0) + 1);
  }

  const maxHeap: [number, string][] = [];
  for (const [char, freq] of charFreq) {
    maxHeap.push([freq, char]);
  }
  maxHeap.sort((a, b) => b[0] - a[0]);

  const res: string[] = [];
  let prevFreq = 0;
  let prevChar = "";

  while (maxHeap.length > 0) {
    const [freq, char] = maxHeap.shift()!;
    res.push(char);

    if (prevFreq > 0) {
      maxHeap.push([prevFreq, prevChar]);
      maxHeap.sort((a, b) => b[0] - a[0]);
    }

    prevFreq = freq - 1;
    prevChar = char;
  }

  if (res.length !== s.length) return "";
  return res.join("");
}
