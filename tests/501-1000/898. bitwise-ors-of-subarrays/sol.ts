function subarrayBitwiseORs(arr: number[]): number {
  const resultOrs = new Set<number>();
  let currentOrs = new Set<number>();

  for (const x of arr) {
    const nextOrs = new Set<number>();
    for (const y of currentOrs) {
      nextOrs.add(x | y);
    }
    nextOrs.add(x);
    nextOrs.forEach((val) => resultOrs.add(val));
    currentOrs = nextOrs;
  }

  return resultOrs.size;
}
