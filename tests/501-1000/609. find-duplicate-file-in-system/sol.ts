function findDuplicate(paths: string[]): string[][] {
  const map = new Map<string, string[]>();
  for (const path of paths) {
    const parts = path.split(" ");
    const directory = parts[0];
    for (let i = 1; i < parts.length; i++) {
      const file = parts[i];
      const parenIndex = file.indexOf("(");
      const name = file.substring(0, parenIndex);
      const content = file.substring(parenIndex + 1, file.length - 1);
      const fullPath = directory + "/" + name;
      if (!map.has(content)) {
        map.set(content, []);
      }
      map.get(content)!.push(fullPath);
    }
  }
  return Array.from(map.values()).filter((group) => group.length > 1);
}
