function minimumLengthEncoding(words: string[]): number {
  words = [...new Set(words)];
  const trie: Record<string, any> = {};
  const nodes: Record<string, any>[] = [];
  for (const word of words) {
    let node = trie;
    for (let i = word.length - 1; i >= 0; i--) {
      const ch = word[i];
      if (!(ch in node)) {
        node[ch] = {};
      }
      node = node[ch];
    }
    nodes.push(node);
  }
  let ans = 0;
  for (let i = 0; i < words.length; i++) {
    if (Object.keys(nodes[i]).length === 0) {
      ans += words[i].length + 1;
    }
  }
  return ans;
}
