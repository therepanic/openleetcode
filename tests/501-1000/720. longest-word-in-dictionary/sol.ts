function longestWord(words: string[]): string {
  class TrieNode {
    children: Map<string, TrieNode> = new Map();
    end: number = -1;
  }

  const root = new TrieNode();
  for (let i = 0; i < words.length; i++) {
    let cur = root;
    for (const ch of words[i]) {
      if (!cur.children.has(ch)) {
        cur.children.set(ch, new TrieNode());
      }
      cur = cur.children.get(ch)!;
    }
    cur.end = i;
  }

  const stack: TrieNode[] = Array.from(root.children.values());
  let ans = "";
  while (stack.length > 0) {
    const cur = stack.pop()!;
    if (cur.end !== -1) {
      const word = words[cur.end];
      if (
        word.length > ans.length ||
        (word.length === ans.length && word < ans)
      ) {
        ans = word;
      }
      for (const [, v] of cur.children) {
        stack.push(v);
      }
    }
  }
  return ans;
}
