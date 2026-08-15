function assignTasks(servers: number[], tasks: number[]): number[] {
  const available: [number, number][] = [];
  const busy: [number, number, number][] = [];
  const cmpA = (a: [number, number], b: [number, number]) =>
    a[0] !== b[0] ? a[0] - b[0] : a[1] - b[1];
  const cmpB = (a: [number, number, number], b: [number, number, number]) =>
    a[0] - b[0];
  const push = <T>(h: T[], x: T, cmp: (a: T, b: T) => number) => {
    h.push(x);
    let i = h.length - 1;
    while (i > 0) {
      const p = (i - 1) >> 1;
      if (cmp(h[p], h[i]) <= 0) break;
      [h[p], h[i]] = [h[i], h[p]];
      i = p;
    }
  };
  const pop = <T>(h: T[], cmp: (a: T, b: T) => number): T => {
    const top = h[0];
    const last = h.pop()!;
    if (h.length > 0) {
      h[0] = last;
      let i = 0;
      while (true) {
        let c = i;
        const l = i * 2 + 1;
        const r = l + 1;
        if (l < h.length && cmp(h[l], h[c]) < 0) c = l;
        if (r < h.length && cmp(h[r], h[c]) < 0) c = r;
        if (c === i) break;
        [h[i], h[c]] = [h[c], h[i]];
        i = c;
      }
    }
    return top;
  };
  for (let i = 0; i < servers.length; i++)
    push(available, [servers[i], i], cmpA);
  const ans: number[] = [];
  let time = 0;
  for (let i = 0; i < tasks.length; i++) {
    time = Math.max(time, i);
    while (busy.length > 0 && busy[0][0] <= time) {
      const [, w, idx] = pop(busy, cmpB);
      push(available, [w, idx], cmpA);
    }
    if (available.length === 0) {
      time = busy[0][0];
      while (busy.length > 0 && busy[0][0] <= time) {
        const [, w, idx] = pop(busy, cmpB);
        push(available, [w, idx], cmpA);
      }
    }
    const [w, idx] = pop(available, cmpA);
    push(busy, [time + tasks[i], w, idx], cmpB);
    ans.push(idx);
  }
  return ans;
}
