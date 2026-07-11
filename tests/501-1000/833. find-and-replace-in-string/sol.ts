function findReplaceString(
  s: string,
  indices: number[],
  sources: string[],
  targets: string[],
): string {
  const patch: { [key: number]: [string, string] } = {};
  for (let k = 0; k < indices.length; k++) {
    const i = indices[k];
    const src = sources[k];
    const tgt = targets[k];
    if (s.substring(i, i + src.length) === src) {
      patch[i] = [src, tgt];
    }
  }
  let res = "";
  let i = 0;
  const n = s.length;
  while (i < n) {
    if (patch[i] !== undefined) {
      const [src, tgt] = patch[i];
      res += tgt;
      i += src.length;
    } else {
      res += s[i];
      i++;
    }
  }
  return res;
}
