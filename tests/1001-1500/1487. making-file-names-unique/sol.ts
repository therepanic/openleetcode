function getFolderNames(names: string[]): string[] {
  const nameCount = new Map<string, number>();
  const result: string[] = [];

  for (const name of names) {
    if (!nameCount.has(name)) {
      result.push(name);
      nameCount.set(name, 1);
    } else {
      let k = nameCount.get(name)!;
      while (nameCount.has(`${name}(${k})`)) {
        k++;
      }
      const newName = `${name}(${k})`;
      result.push(newName);
      nameCount.set(name, k + 1);
      nameCount.set(newName, 1);
    }
  }

  return result;
}
