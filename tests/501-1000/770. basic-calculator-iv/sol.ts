function basicCalculatorIV(
  expression: string,
  evalvars: string[],
  evalints: number[],
): string[] {
  const evalmap: Record<string, number> = {};
  for (let i = 0; i < evalvars.length; i++) evalmap[evalvars[i]] = evalints[i];

  const tokens: string[] = [];
  let buf = "";
  for (const ch of expression) {
    if (/[a-zA-Z0-9]/.test(ch)) {
      buf += ch;
    } else {
      if (buf) {
        tokens.push(buf);
        buf = "";
      }
      if ("+-*()".includes(ch)) tokens.push(ch);
    }
  }
  if (buf) tokens.push(buf);

  const vals: Record<string, number>[] = [];
  const ops: string[] = [];
  const prec: Record<string, number> = { "+": 1, "-": 1, "*": 2 };

  const combine = (poly: Record<string, number>): Record<string, number> => {
    const res: Record<string, number> = {};
    for (const k in poly) if (poly[k] !== 0) res[k] = (res[k] || 0) + poly[k];
    return res;
  };

  const add = (a: Record<string, number>, b: Record<string, number>) => {
    const res: Record<string, number> = { ...a };
    for (const k in b) res[k] = (res[k] || 0) + b[k];
    return combine(res);
  };

  const sub = (a: Record<string, number>, b: Record<string, number>) => {
    const res: Record<string, number> = { ...a };
    for (const k in b) res[k] = (res[k] || 0) - b[k];
    return combine(res);
  };

  const mul = (a: Record<string, number>, b: Record<string, number>) => {
    const res: Record<string, number> = {};
    for (const k1 in a) {
      const va = k1 ? k1.split(",") : [];
      for (const k2 in b) {
        const vb = k2 ? k2.split(",") : [];
        const merged = [...va, ...vb].sort();
        const key = merged.join(",");
        res[key] = (res[key] || 0) + a[k1] * b[k2];
      }
    }
    return combine(res);
  };

  const parseToken = (tok: string): Record<string, number> => {
    const res: Record<string, number> = {};
    if (/^-?\d+$/.test(tok)) {
      res[""] = parseInt(tok);
    } else if (tok in evalmap) {
      res[""] = evalmap[tok];
    } else {
      res[tok] = 1;
    }
    return res;
  };

  const applyOp = () => {
    const op = ops.pop()!;
    const b = vals.pop()!;
    const a = vals.pop()!;
    if (op === "+") vals.push(add(a, b));
    else if (op === "-") vals.push(sub(a, b));
    else vals.push(mul(a, b));
  };

  for (const tok of tokens) {
    if (tok === "(") ops.push(tok);
    else if (tok === ")") {
      while (ops.length && ops[ops.length - 1] !== "(") applyOp();
      ops.pop();
    } else if (tok in prec) {
      while (
        ops.length &&
        ops[ops.length - 1] !== "(" &&
        prec[ops[ops.length - 1]] >= prec[tok]
      )
        applyOp();
      ops.push(tok);
    } else vals.push(parseToken(tok));
  }
  while (ops.length) applyOp();
  const poly = vals[vals.length - 1];

  const items: [string[], number][] = [];
  for (const k in poly) {
    if (poly[k] !== 0) {
      const vars = k ? k.split(",") : [];
      items.push([vars, poly[k]]);
    }
  }
  items.sort((a, b) => {
    if (a[0].length !== b[0].length) return b[0].length - a[0].length;
    return a[0].join("*").localeCompare(b[0].join("*"));
  });

  return items.map(([vars, coeff]) => {
    if (vars.length === 0) return coeff.toString();
    return coeff + "*" + vars.join("*");
  });
}
