function parseBoolExpr(expression: string): boolean {
  const st: any[][] = [[]];
  for (const ch of expression) {
    if (ch === "&") {
      st.push(["&"]);
    } else if (ch === "|") {
      st.push(["|"]);
    } else if (ch === "!") {
      st.push(["!"]);
    } else if (ch === "t") {
      st[st.length - 1].push(true);
    } else if (ch === "f") {
      st[st.length - 1].push(false);
    } else if (ch === ")") {
      const popped = st.pop()!;
      const op = popped.shift() as string;
      const top = st[st.length - 1];
      if (op === "&") {
        top.push(popped.every((v: boolean) => v));
      } else if (op === "|") {
        top.push(popped.some((v: boolean) => v));
      } else if (op === "!") {
        top.push(!popped[0]);
      }
    }
  }
  return st[0][0] as boolean;
}
