function isValid(s: string): boolean {
  const stack: string[] = [];
  for (const ch of s) {
    if (ch === "(" || ch === "[" || ch === "{") stack.push(ch);
    else {
      if (stack.length === 0) return false;
      const top = stack.pop()!;
      if (ch === ")" && top !== "(") return false;
      if (ch === "]" && top !== "[") return false;
      if (ch === "}" && top !== "{") return false;
    }
  }
  return stack.length === 0;
}
