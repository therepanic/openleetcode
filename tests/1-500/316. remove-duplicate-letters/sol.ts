function removeDuplicateLetters(s: string): string {
  const lastOccur: Map<string, number> = new Map();
  for (let i = 0; i < s.length; i++) {
    lastOccur.set(s[i], i);
  }

  const stack: string[] = [];
  const visited: Set<string> = new Set();

  for (let i = 0; i < s.length; i++) {
    const char = s[i];
    if (visited.has(char)) {
      continue;
    }

    while (
      stack.length > 0 &&
      char < stack[stack.length - 1] &&
      i < (lastOccur.get(stack[stack.length - 1]) ?? -1)
    ) {
      visited.delete(stack.pop()!);
    }

    visited.add(char);
    stack.push(char);
  }

  return stack.join("");
}
