function rotateString(s: string, goal: string): boolean {
  return s.length === goal.length && (s + s).includes(goal);
}
