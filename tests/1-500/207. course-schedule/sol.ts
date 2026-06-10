function canFinish(numCourses: number, prerequisites: number[][]): boolean {
  const graph: number[][] = Array.from({ length: numCourses }, () => []);
  const indegree = Array(numCourses).fill(0);
  for (const [course, pre] of prerequisites) {
    graph[pre].push(course);
    indegree[course]++;
  }
  const queue: number[] = [];
  for (let i = 0; i < numCourses; i++) if (indegree[i] === 0) queue.push(i);
  let seen = 0;
  for (let head = 0; head < queue.length; head++) {
    const node = queue[head];
    seen++;
    for (const nxt of graph[node]) {
      indegree[nxt]--;
      if (indegree[nxt] === 0) queue.push(nxt);
    }
  }
  return seen === numCourses;
}
