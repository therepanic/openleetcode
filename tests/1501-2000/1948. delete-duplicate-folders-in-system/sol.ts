function deleteDuplicateFolder(paths: string[][]): string[][] {
  class Node {
    name: string;
    children: Map<string, Node>;
    signature: string;

    constructor(name: string) {
      this.name = name;
      this.children = new Map();
      this.signature = "";
    }
  }

  const signatureCount = new Map<string, number>();

  const root = new Node("");

  for (const path of paths) {
    let node = root;
    for (const folder of path) {
      if (!node.children.has(folder)) {
        node.children.set(folder, new Node(folder));
      }
      node = node.children.get(folder)!;
    }
  }

  function dfs(node: Node): string {
    if (node.children.size === 0) {
      node.signature = "";
      return "";
    }

    const childSignatures: string[] = [];
    const sorted = [...node.children.keys()].sort();
    for (const name of sorted) {
      const child = node.children.get(name)!;
      const childSignature = dfs(child);
      childSignatures.push(`${name}(${childSignature})`);
    }

    node.signature = childSignatures.join("");
    signatureCount.set(
      node.signature,
      (signatureCount.get(node.signature) || 0) + 1,
    );
    return node.signature;
  }

  dfs(root);

  const result: string[][] = [];
  let currentPath: string[] = [];

  function dfs2(node: Node) {
    if (
      node.children.size > 0 &&
      (signatureCount.get(node.signature) || 0) >= 2
    ) {
      return;
    }

    currentPath.push(node.name);
    result.push([...currentPath]);

    const sorted = [...node.children.keys()].sort();
    for (const name of sorted) {
      dfs2(node.children.get(name)!);
    }
    currentPath.pop();
  }

  const sortedRoot = [...root.children.keys()].sort();
  for (const name of sortedRoot) {
    dfs2(root.children.get(name)!);
  }

  return result;
}
