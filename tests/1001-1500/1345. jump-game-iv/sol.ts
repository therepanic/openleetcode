function minJumps(arr: number[]): number {
  const n = arr.length;
  if (n === 1) return 0;

  const mp: Map<number, number[]> = new Map();
  for (let i = 0; i < n; i++) {
    if (!mp.has(arr[i])) mp.set(arr[i], []);
    mp.get(arr[i])!.push(i);
  }

  const q: [number, number][] = [[0, 0]];
  const vis: boolean[] = new Array(n).fill(false);
  vis[0] = true;

  let head = 0;
  while (head < q.length) {
    const [node, dist] = q[head++];
    if (node === n - 1) return dist;

    if (node - 1 >= 0 && !vis[node - 1]) {
      vis[node - 1] = true;
      q.push([node - 1, dist + 1]);
    }
    if (node + 1 < n && !vis[node + 1]) {
      vis[node + 1] = true;
      q.push([node + 1, dist + 1]);
    }

    for (const nxt of mp.get(arr[node]) || []) {
      if (!vis[nxt]) {
        vis[nxt] = true;
        q.push([nxt, dist + 1]);
      }
    }
    mp.set(arr[node], []);
  }
  return -1;
}
