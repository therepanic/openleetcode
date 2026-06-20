function findItinerary(tickets: string[][]): string[] {
  const graph: Map<string, string[]> = new Map();

  tickets.sort((a, b) => {
    if (a[0] !== b[0]) return b[0].localeCompare(a[0]);
    return b[1].localeCompare(a[1]);
  });

  for (const [from, to] of tickets) {
    if (!graph.has(from)) {
      graph.set(from, []);
    }
    graph.get(from)!.push(to);
  }

  const st: string[] = ["JFK"];
  const newItinerary: string[] = [];

  while (st.length > 0) {
    const top = st[st.length - 1];
    if (graph.has(top) && graph.get(top)!.length > 0) {
      st.push(graph.get(top)!.pop()!);
    } else {
      newItinerary.push(st.pop()!);
    }
  }

  return newItinerary.reverse();
}
