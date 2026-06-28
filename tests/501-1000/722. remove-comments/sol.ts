function removeComments(source: string[]): string[] {
  let inBlock = false;
  const ans: string[] = [];
  let newline: string[] = [];
  for (const line of source) {
    let i = 0;
    if (!inBlock) {
      newline = [];
    }
    while (i < line.length) {
      if (
        i + 1 < line.length &&
        line[i] === "/" &&
        line[i + 1] === "*" &&
        !inBlock
      ) {
        inBlock = true;
        i++;
      } else if (
        i + 1 < line.length &&
        line[i] === "*" &&
        line[i + 1] === "/" &&
        inBlock
      ) {
        inBlock = false;
        i++;
      } else if (
        !inBlock &&
        i + 1 < line.length &&
        line[i] === "/" &&
        line[i + 1] === "/"
      ) {
        break;
      } else if (!inBlock) {
        newline.push(line[i]);
      }
      i++;
    }
    if (newline.length > 0 && !inBlock) {
      ans.push(newline.join(""));
    }
  }
  return ans;
}
