function minAddToMakeValid(s: string): number {
  const l: string[] = ["0"];
  for (const i of s) {
    if (l[l.length - 1] === "(" && i === ")") {
      l.pop();
    } else {
      l.push(i);
    }
  }
  return l.length - 1;
}
