function modifyString(s: string): string {
  const arr: string[] = s.split("");
  const n = arr.length;
  for (let i = 0; i < n; i++) {
    if (arr[i] === "?") {
      const left: string = i > 0 ? arr[i - 1] : " ";
      const right: string = i + 1 < n ? arr[i + 1] : " ";
      if (left !== "a" && right !== "a") {
        arr[i] = "a";
      } else if (left !== "b" && right !== "b") {
        arr[i] = "b";
      } else {
        arr[i] = "c";
      }
    }
  }
  return arr.join("");
}
