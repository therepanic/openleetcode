function restoreString(s: string, indices: number[]): string {
  const res: string[] = new Array(indices.length).fill("");
  for (let i = 0; i < indices.length; i++) {
    res[indices[i]] = s[i];
  }
  return res.join("");
}
