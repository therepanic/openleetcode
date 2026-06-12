function evalRPN(tokens: string[]): number {
  const stack: number[] = [];
  for (const token of tokens) {
    if (token === "+" || token === "-" || token === "*" || token === "/") {
      const b = stack.pop()!;
      const a = stack.pop()!;
      switch (token) {
        case "+":
          stack.push(a + b);
          break;
        case "-":
          stack.push(a - b);
          break;
        case "*":
          stack.push(a * b);
          break;
        default:
          stack.push((a / b) | 0);
          break;
      }
    } else {
      stack.push(parseInt(token, 10));
    }
  }
  return stack[stack.length - 1];
}
