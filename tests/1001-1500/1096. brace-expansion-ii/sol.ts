function braceExpansionII(expression: string): string[] {
  const stack: string[][] = [];
  let res: string[] = [];
  let cur: string[] = [];
  for (const v of expression) {
    if (v >= "a" && v <= "z") {
      if (cur.length === 0) {
        cur = [v];
      } else {
        cur = cur.map((c) => c + v);
      }
    } else if (v === "{") {
      stack.push(res);
      stack.push(cur);
      res = [];
      cur = [];
    } else if (v === "}") {
      const pre = stack.pop()!;
      const preRes = stack.pop()!;
      const merged = [...res, ...cur];
      if (pre.length === 0) {
        cur = merged;
      } else {
        cur = pre.flatMap((p) => merged.map((c) => p + c));
      }
      res = preRes;
    } else if (v === ",") {
      res = res.concat(cur);
      cur = [];
    }
  }
  return [...new Set([...res, ...cur])].sort();
}
