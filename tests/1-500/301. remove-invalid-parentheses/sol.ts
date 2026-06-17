function removeInvalidParentheses(s: string): string[] {
  const isValid = (str: string): boolean => {
    let ctr = 0;
    for (const ch of str) {
      if (ch === "(") {
        ctr++;
      } else if (ch === ")") {
        if (ctr === 0) return false;
        ctr--;
      }
    }
    return ctr === 0;
  };

  let level = new Set([s]);
  while (true) {
    const valid = Array.from(level).filter(isValid);
    if (valid.length > 0) return valid;
    const nextLevel = new Set<string>();
    for (const str of level) {
      for (let i = 0; i < str.length; i++) {
        nextLevel.add(str.slice(0, i) + str.slice(i + 1));
      }
    }
    level = nextLevel;
  }
}
