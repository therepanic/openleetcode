function catMouseGame(graph: number[][]): number {
  const MOUSE = 0;
  const CAT = 1;
  const MOUSE_WIN = 1;
  const CAT_WIN = 2;
  const DRAW = 0;

  const n = graph.length;
  const results: Map<string, number> = new Map();
  for (let i = 1; i < n; i++) {
    results.set(`0,${i},${CAT}`, MOUSE_WIN);
    results.set(`0,${i},${MOUSE}`, MOUSE_WIN);
    results.set(`${i},${i},${CAT}`, CAT_WIN);
    results.set(`${i},${i},${MOUSE}`, CAT_WIN);
  }

  const degree: Map<string, number> = new Map();
  for (let mouse = 1; mouse < n; mouse++) {
    for (let cat = 1; cat < n; cat++) {
      degree.set(`${mouse},${cat},${MOUSE}`, graph[mouse].length);
      degree.set(
        `${mouse},${cat},${CAT}`,
        graph[cat].filter((x) => x !== 0).length,
      );
    }
  }

  const q: string[] = Array.from(results.keys());
  let front = 0;

  while (front < q.length) {
    const state = q[front++];
    const parts = state.split(",");
    const mouse = parseInt(parts[0]);
    const cat = parseInt(parts[1]);
    const turn = parseInt(parts[2]);
    const curResult = results.get(state)!;

    const prevStates: string[] = [];
    if (turn === MOUSE) {
      for (const prevCat of graph[cat]) {
        prevStates.push(`${mouse},${prevCat},${CAT}`);
      }
    } else {
      for (const prevMouse of graph[mouse]) {
        prevStates.push(`${prevMouse},${cat},${MOUSE}`);
      }
    }

    for (const prevState of prevStates) {
      if (results.has(prevState)) continue;
      const prevParts = prevState.split(",");
      const prevMouse = parseInt(prevParts[0]);
      const prevCat = parseInt(prevParts[1]);
      const prevTurn = parseInt(prevParts[2]);
      if (prevCat === 0) continue;

      degree.set(prevState, degree.get(prevState)! - 1);
      const isMoverWinner =
        (curResult === MOUSE_WIN && prevTurn === MOUSE) ||
        (curResult === CAT_WIN && prevTurn === CAT);
      if (isMoverWinner || degree.get(prevState) === 0) {
        results.set(prevState, curResult);
        q.push(prevState);
      }
    }
  }

  return results.get(`1,2,${MOUSE}`) ?? DRAW;
}
