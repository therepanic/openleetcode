function crackSafe(n: number, k: number): string {
  if (n === 1) {
    return Array.from({ length: k }, (_, i) => i.toString()).join("");
  }

  const adj: Map<string, number[]> = new Map();
  const startNode: string = "0".repeat(n - 1);
  let res: string = "";

  function visit(node: string): void {
    if (!adj.has(node)) {
      adj.set(node, []);
      for (let i = k - 1; i >= 0; i--) {
        adj.get(node)!.push(i);
      }
    }
    while (adj.get(node)!.length > 0) {
      const digit = adj.get(node)!.pop()!;
      const nextNode = (node + digit.toString()).slice(1);
      visit(nextNode);
      res += digit.toString();
    }
  }

  visit(startNode);
  return res + startNode;
}
