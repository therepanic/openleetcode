function longestDiverseString(a: number, b: number, c: number): string {
  const counts = [a, b, c];
  const letters = ["a", "b", "c"];
  const result: string[] = [];
  while (true) {
    let choice = -1;
    for (let index = 0; index < 3; index++) {
      if (counts[index] === 0) continue;
      if (
        result.length >= 2 &&
        result[result.length - 1] === letters[index] &&
        result[result.length - 2] === letters[index]
      )
        continue;
      if (choice === -1 || counts[index] > counts[choice]) choice = index;
    }
    if (choice === -1) break;
    result.push(letters[choice]);
    counts[choice]--;
  }
  return result.join("");
}
