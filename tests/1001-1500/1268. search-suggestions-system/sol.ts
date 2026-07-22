function suggestedProducts(products: string[], searchWord: string): string[][] {
  products.sort();
  const root: Map<string, [Map<string, any>, string[]]> = new Map();

  // Insert each product into the Trie and store top 3 suggestions
  for (const product of products) {
    let node = root;
    for (const ch of product) {
      if (!node.has(ch)) {
        node.set(ch, [new Map(), []]);
      }
      const pair = node.get(ch)!;
      if (pair[1].length < 3) {
        pair[1].push(product);
      }
      node = pair[0];
    }
  }

  // Search each character of searchWord in the Trie
  const result: string[][] = [];
  let node: Map<string, any> | null = root;
  for (const ch of searchWord) {
    if (node && node.has(ch)) {
      const pair = node.get(ch)!;
      result.push([...pair[1]]);
      node = pair[0];
    } else {
      node = null;
      result.push([]);
    }
  }

  return result;
}
