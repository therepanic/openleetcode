function groupThePeople(groupSizes: number[]): number[][] {
  const ans: number[][] = [];
  const mp: Map<number, number[]> = new Map();
  for (let i = 0; i < groupSizes.length; i++) {
    const v = groupSizes[i];
    if (!mp.has(v)) mp.set(v, []);
    const list = mp.get(v)!;
    list.push(i);
    if (list.length === v) {
      ans.push([...list]);
      mp.set(v, []);
    }
  }
  return ans;
}
