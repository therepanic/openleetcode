function finalValueAfterOperations(operations: string[]): number {
  return operations.reduce((sum, op) => sum + (op[1] === "+" ? 1 : -1), 0);
}
