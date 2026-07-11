function longestDupSubstring(s: string): string {
  const trans: Array<Map<string, number>> = [new Map()];
  const link: number[] = [-1];
  const len: number[] = [0];
  const occ: number[] = [0];
  const firstPos: number[] = [-1];
  let last = 0;

  const extend = (ch: string, pos: number): void => {
    const cur = trans.length;
    trans.push(new Map());
    link.push(0);
    len.push(len[last] + 1);
    occ.push(1);
    firstPos.push(pos);

    let p = last;
    while (p !== -1 && !trans[p].has(ch)) {
      trans[p].set(ch, cur);
      p = link[p];
    }
    if (p === -1) {
      link[cur] = 0;
    } else {
      const q = trans[p].get(ch)!;
      if (len[p] + 1 === len[q]) {
        link[cur] = q;
      } else {
        const clone = trans.length;
        trans.push(new Map(trans[q]));
        link.push(link[q]);
        len.push(len[p] + 1);
        occ.push(0);
        firstPos.push(firstPos[q]);
        while (p !== -1 && trans[p].get(ch) === q) {
          trans[p].set(ch, clone);
          p = link[p];
        }
        link[q] = clone;
        link[cur] = clone;
      }
    }
    last = cur;
  };

  for (let i = 0; i < s.length; i++) {
    extend(s[i], i);
  }

  const order = [...Array(trans.length).keys()].sort((a, b) => len[a] - len[b]);
  for (let i = order.length - 1; i > 0; i--) {
    const v = order[i];
    if (link[v] >= 0) {
      occ[link[v]] += occ[v];
    }
  }

  let best = 0;
  for (let v = 1; v < trans.length; v++) {
    if (occ[v] >= 2 && len[v] > len[best]) {
      best = v;
    }
  }

  if (len[best] === 0) {
    return "";
  }
  const end = firstPos[best];
  return s.slice(end - len[best] + 1, end + 1);
}
