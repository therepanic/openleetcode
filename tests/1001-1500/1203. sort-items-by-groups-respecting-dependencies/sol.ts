function sortItems(
  n: number,
  m: number,
  group: number[],
  beforeItems: number[][],
): number[] {
  const groupToItems: Map<number, Set<number>> = new Map();
  let newGroup = m;
  for (let i = 0; i < n; i++) {
    if (group[i] === -1) group[i] = newGroup++;
    if (!groupToItems.has(group[i])) groupToItems.set(group[i], new Set());
    groupToItems.get(group[i])!.add(i);
  }

  const intraPred: Map<number, Set<number>> = new Map();
  const intraSucc: Map<number, Set<number>> = new Map();
  const interPred: Map<number, Set<number>> = new Map();
  const interSucc: Map<number, Set<number>> = new Map();

  for (let i = 0; i < n; i++) {
    for (const before of beforeItems[i]) {
      if (group[i] === group[before]) {
        if (!intraPred.has(i)) intraPred.set(i, new Set());
        intraPred.get(i)!.add(before);
        if (!intraSucc.has(before)) intraSucc.set(before, new Set());
        intraSucc.get(before)!.add(i);
      } else {
        if (!interPred.has(group[i])) interPred.set(group[i], new Set());
        interPred.get(group[i])!.add(group[before]);
        if (!interSucc.has(group[before]))
          interSucc.set(group[before], new Set());
        interSucc.get(group[before])!.add(group[i]);
      }
    }
  }

  function topoSort(
    nodes: Set<number>,
    pred: Map<number, Set<number>>,
    succ: Map<number, Set<number>>,
  ): number[] {
    const order: number[] = [];
    const queue: number[] = [];
    for (const node of nodes) {
      if (!pred.has(node) || pred.get(node)!.size === 0) queue.push(node);
    }
    while (queue.length) {
      const node = queue.shift()!;
      order.push(node);
      for (const s of succ.get(node) ?? []) {
        pred.get(s)?.delete(node);
        if (!pred.has(s) || pred.get(s)!.size === 0) queue.push(s);
      }
    }
    return order.length === nodes.size ? order : [];
  }

  const groupsOrder = topoSort(
    new Set(groupToItems.keys()),
    interPred,
    interSucc,
  );
  if (groupsOrder.length === 0) return [];

  const result: number[] = [];
  for (const grp of groupsOrder) {
    const order = topoSort(groupToItems.get(grp)!, intraPred, intraSucc);
    if (order.length === 0) return [];
    result.push(...order);
  }
  return result;
}
