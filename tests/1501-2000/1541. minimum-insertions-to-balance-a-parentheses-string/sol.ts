function minInsertions(s: string): number {
  const stack: string[] = [];
  let count = 0;
  let i = 0;

  while (i < s.length) {
    if (s[i] === "(") {
      stack.push("(");
    } else {
      if (stack.length === 0) {
        if (i !== s.length - 1 && s[i + 1] === ")") {
          count += 1;
          i++;
        } else {
          count += 2;
        }
      } else {
        if (i !== s.length - 1 && s[i + 1] === ")") {
          stack.pop();
          i++;
        } else {
          count += 1;
          stack.pop();
        }
      }
    }
    i++;
  }

  return count + stack.length * 2;
}
