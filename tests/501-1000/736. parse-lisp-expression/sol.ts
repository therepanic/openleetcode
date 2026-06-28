function evaluate(expression: string): number {
  const isnum = (t: string): boolean =>
    t[0] === "-" || (t[0] >= "0" && t[0] <= "9");

  const lookup = (v: string, env: Map<string, number>[]): number => {
    for (let i = env.length - 1; i >= 0; i--) {
      if (env[i].has(v)) return env[i].get(v)!;
    }
    return 0;
  };

  const toks = (s: string): string[] => {
    const res: string[] = [];
    let i = 0,
      n = s.length,
      bal = 0,
      st = 0;
    while (i < n) {
      const c = s[i];
      if (c === "(") bal++;
      else if (c === ")") bal--;
      else if (c === " " && bal === 0) {
        if (st < i) res.push(s.substring(st, i));
        st = i + 1;
      }
      i++;
    }
    if (st < n) res.push(s.substring(st));
    return res;
  };

  const evals = (e: string, env: Map<string, number>[]): number => {
    if (e[0] !== "(") {
      if (isnum(e)) return parseInt(e);
      return lookup(e, env);
    }
    const inner = e.substring(1, e.length - 1);
    const parts = toks(inner);
    const op = parts[0];
    if (op === "add") return evals(parts[1], env) + evals(parts[2], env);
    if (op === "mult") return evals(parts[1], env) * evals(parts[2], env);

    const loc = new Map<string, number>();
    env.push(loc);
    let i = 1;
    while (i < parts.length - 1) {
      const v = parts[i];
      const val = evals(parts[i + 1], env);
      loc.set(v, val);
      i += 2;
    }
    const ans = evals(parts[parts.length - 1], env);
    env.pop();
    return ans;
  };

  return evals(expression, []);
}
