function groupAnagrams(strs: string[]): string[][] {
  const groups = new Map<string, string[]>();
  const keys: string[] = [];

  for (const word of strs) {
    const key = word.split("").sort().join("");
    if (!groups.has(key)) {
      groups.set(key, []);
      keys.push(key);
    }
    groups.get(key)!.push(word);
  }

  return keys.map((key) => groups.get(key)!);
}
