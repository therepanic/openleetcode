function minOperationsToFlip(expression: string): number {
  const n = expression.length;
  const loc = new Map<number, number>();
  const stack: number[] = [];
  for (let i = n - 1; i >= 0; --i) {
    if (expression[i] === ")") stack.push(i);
    else if (expression[i] === "(") loc.set(stack.pop()!, i);
  }

  const solve = (lo: number, hi: number): [number, number] => {
    if (lo === hi) return [Number(expression[lo]), 1];
    if (expression[hi] === ")" && loc.get(hi) === lo)
      return solve(lo + 1, hi - 1);
    let mid = (loc.get(hi) ?? hi) - 1;
    const [v, c] = solve(mid + 1, hi);
    const [vv, cc] = solve(lo, mid - 1);
    let val: number, chg: number;
    if (expression[mid] === "|") {
      val = v | vv;
      if (v === 0 && vv === 0) chg = Math.min(c, cc);
      else if (v === 1 && vv === 1) chg = 1 + Math.min(c, cc);
      else chg = 1;
    } else {
      val = v & vv;
      if (v === 0 && vv === 0) chg = 1 + Math.min(c, cc);
      else if (v === 1 && vv === 1) chg = Math.min(c, cc);
      else chg = 1;
    }
    return [val, chg];
  };

  return solve(0, n - 1)[1];
}
