function numOfMinutes(
  n: number,
  headID: number,
  manager: number[],
  informTime: number[],
): number {
  const children: number[][] = Array.from({ length: n }, () => []);
  for (let employee = 0; employee < n; employee++) {
    const parent = manager[employee];
    if (parent !== -1) {
      children[parent].push(employee);
    }
  }
  const stack: [number, number][] = [[headID, 0]];
  let answer = 0;
  while (stack.length > 0) {
    const [employee, elapsed] = stack.pop()!;
    answer = Math.max(answer, elapsed);
    for (const child of children[employee]) {
      stack.push([child, elapsed + informTime[employee]]);
    }
  }
  return answer;
}
