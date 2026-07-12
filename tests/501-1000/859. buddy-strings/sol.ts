function buddyStrings(s: string, goal: string): boolean {
  if (s.length !== goal.length) return false;
  if (s === goal) {
    return new Set(s).size < s.length;
  }
  const diffs: number[] = [];
  for (let i = 0; i < s.length; i++) {
    if (s[i] !== goal[i]) {
      diffs.push(i);
    }
  }
  return (
    diffs.length === 2 &&
    s[diffs[0]] === goal[diffs[1]] &&
    s[diffs[1]] === goal[diffs[0]]
  );
}
