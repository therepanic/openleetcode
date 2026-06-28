function fallingSquares(positions: number[][]): number[] {
  const ans: number[] = [];
  const posSet = new Set<number>();
  for (const [l, side] of positions) {
    posSet.add(l);
    posSet.add(l + side - 1);
  }
  const pos = Array.from(posSet).sort((a, b) => a - b);
  const mp = new Map<number, number>();
  pos.forEach((v, i) => mp.set(v, i));
  const n = pos.length;
  const arr = new Array(n).fill(0);
  const tree = new Array(4 * n).fill(0);
  const lazy = new Array(4 * n).fill(0);

  function buildTree(node: number, start: number, end: number): void {
    if (start === end) {
      tree[node] = arr[start];
      return;
    }
    const mid = Math.floor((start + end) / 2);
    buildTree(node * 2 + 1, start, mid);
    buildTree(node * 2 + 2, mid + 1, end);
    tree[node] = Math.max(tree[node * 2 + 1], tree[node * 2 + 2]);
  }

  function updateHelper(
    node: number,
    start: number,
    end: number,
    left: number,
    right: number,
    val: number,
  ): void {
    if (lazy[node] !== 0) {
      tree[node] = Math.max(tree[node], lazy[node]);
      if (start !== end) {
        lazy[node * 2 + 1] = lazy[node];
        lazy[node * 2 + 2] = lazy[node];
      }
      lazy[node] = 0;
    }

    if (start > right || end < left || start > end) {
      return;
    }

    if (start >= left && end <= right) {
      tree[node] = val;
      if (start !== end) {
        lazy[node * 2 + 1] = val;
        lazy[node * 2 + 2] = val;
      }
      return;
    }

    const mid = Math.floor((start + end) / 2);
    updateHelper(node * 2 + 1, start, mid, left, right, val);
    updateHelper(node * 2 + 2, mid + 1, end, left, right, val);
    tree[node] = Math.max(tree[node * 2 + 1], tree[node * 2 + 2]);
  }

  function queryHelper(
    node: number,
    start: number,
    end: number,
    left: number,
    right: number,
  ): number {
    if (lazy[node] !== 0) {
      tree[node] = Math.max(tree[node], lazy[node]);
      if (start !== end) {
        lazy[node * 2 + 1] = lazy[node];
        lazy[node * 2 + 2] = lazy[node];
      }
      lazy[node] = 0;
    }

    if (start >= left && end <= right) {
      return tree[node];
    }

    if (start > right || end < left) {
      return 0;
    }

    const mid = Math.floor((start + end) / 2);
    return Math.max(
      queryHelper(node * 2 + 1, start, mid, left, right),
      queryHelper(node * 2 + 2, mid + 1, end, left, right),
    );
  }

  function updateRange(left: number, right: number, val: number): void {
    updateHelper(0, 0, n - 1, left, right, val);
  }

  function query(left: number, right: number): number {
    return queryHelper(0, 0, n - 1, left, right);
  }

  if (n > 0) {
    buildTree(0, 0, n - 1);
  }

  for (const [l, side] of positions) {
    const left = mp.get(l)!;
    const right = mp.get(l + side - 1)!;
    const mx = query(left, right);
    updateRange(left, right, mx + side);
    ans.push(query(0, n - 1));
  }

  return ans;
}
