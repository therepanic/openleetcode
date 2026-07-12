function splitIntoFibonacci(num: string): number[] {
  const invalid = (x: string): boolean => {
    return (
      (x[0] === "0" && x.length > 1) || x.length > 10 || Number(x) >= 2147483648
    );
  };

  const check = (a0: string, a1: string, num: string): number[] => {
    let i = 0;
    const ret: number[] = [parseInt(a0), parseInt(a1)];
    let curA0 = a0,
      curA1 = a1;
    while (i < num.length) {
      const a0Val = parseInt(curA0);
      const a1Val = parseInt(curA1);
      const res = (a0Val + a1Val).toString();
      let j = 0;
      while (i < num.length && j < res.length && res[j] === num[i]) {
        j++;
        i++;
      }
      if (j < res.length || invalid(res)) return [];
      curA0 = curA1;
      curA1 = res;
      ret.push(parseInt(res));
    }
    return ret;
  };

  const n = num.length;
  for (let j = 1; j < n - 1; j++) {
    for (let i = 0; i < j; i++) {
      const a0 = num.substring(0, i + 1);
      const a1 = num.substring(i + 1, j + 1);
      if (invalid(a0) || invalid(a1)) continue;
      const ret = check(a0, a1, num.substring(j + 1));
      if (ret.length > 0) return ret;
    }
  }
  return [];
}
