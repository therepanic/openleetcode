function makeGood(s: string): string {
  const stack: string[] = [];
  for (const ch of s) {
    if (
      stack.length > 0 &&
      ch.toLowerCase() === stack[stack.length - 1].toLowerCase() &&
      ch !== stack[stack.length - 1]
    ) {
      stack.pop();
    } else {
      stack.push(ch);
    }
  }
  return stack.join("");
}
