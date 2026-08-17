function countStudents(students: number[], sandwiches: number[]): number {
  const s: number[] = [...students];
  const sw: number[] = [...sandwiches];
  let c = 0;
  while (s.length > 0) {
    if (s[0] === sw[0]) {
      sw.shift();
      s.shift();
      c = 0;
    } else {
      s.push(s.shift()!);
      c++;
    }
    if (c === s.length) break;
  }
  return s.length;
}
