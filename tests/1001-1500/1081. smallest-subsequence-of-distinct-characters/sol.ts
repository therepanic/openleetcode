function smallestSubsequence(s: string): string {
  const fqMap: { [key: string]: number } = {};
  const stack: string[] = [];
  const visited = new Set<string>();
  for (const ch of s) {
    fqMap[ch] = (fqMap[ch] || 0) + 1;
  }
  for (const ch of s) {
    fqMap[ch]--;
    if (visited.has(ch)) {
      continue;
    }
    while (
      stack.length > 0 &&
      ch < stack[stack.length - 1] &&
      fqMap[stack[stack.length - 1]] > 0
    ) {
      visited.delete(stack.pop()!);
    }
    visited.add(ch);
    stack.push(ch);
  }
  return stack.join("");
}
