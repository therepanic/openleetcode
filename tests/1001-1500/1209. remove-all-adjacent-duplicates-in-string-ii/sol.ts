function removeDuplicates(s: string, k: number): string {
  const stack: [string, number][] = [];
  for (const char of s) {
    if (stack.length > 0 && stack[stack.length - 1][0] === char) {
      stack[stack.length - 1][1]++;
    } else {
      stack.push([char, 1]);
    }
    if (stack[stack.length - 1][1] === k) {
      stack.pop();
    }
  }
  let result = "";
  for (const [char, count] of stack) {
    result += char.repeat(count);
  }
  return result;
}
