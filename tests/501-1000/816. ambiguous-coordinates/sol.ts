function ambiguousCoordinates(s: string): string[] {
  s = s.substring(1, s.length - 1);
  const finalResults: string[] = [];

  function getValidNumbers(numStr: string): string[] {
    const res: string[] = [];

    for (let i = 1; i <= numStr.length; i++) {
      const left = numStr.substring(0, i);
      const right = numStr.substring(i);

      if ((left.length > 1 && left.startsWith("0")) || right.endsWith("0")) {
        continue;
      }

      if (right.length === 0) {
        res.push(left);
      } else {
        res.push(left + "." + right);
      }
    }

    return res;
  }

  for (let i = 1; i < s.length; i++) {
    const xOptions = getValidNumbers(s.substring(0, i));
    const yOptions = getValidNumbers(s.substring(i));

    for (const x of xOptions) {
      for (const y of yOptions) {
        finalResults.push("(" + x + ", " + y + ")");
      }
    }
  }

  return finalResults;
}
