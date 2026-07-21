function watchedVideosByFriends(
  watchedVideos: string[][],
  friends: number[][],
  id: number,
  level: number,
): string[] {
  const n = friends.length;
  const visited: boolean[] = new Array(n).fill(false);
  const q: [number, number][] = [[id, 0]];
  visited[id] = true;

  const targetPeople: number[] = [];

  while (q.length > 0) {
    const [person, dist] = q.shift()!;

    if (dist === level) {
      targetPeople.push(person);
      continue;
    }

    for (const f of friends[person]) {
      if (!visited[f]) {
        visited[f] = true;
        q.push([f, dist + 1]);
      }
    }
  }

  const freq: { [key: string]: number } = {};
  for (const p of targetPeople) {
    for (const vid of watchedVideos[p]) {
      freq[vid] = (freq[vid] || 0) + 1;
    }
  }

  return Object.keys(freq).sort((a, b) => {
    if (freq[a] !== freq[b]) {
      return freq[a] - freq[b];
    }
    return a < b ? -1 : a > b ? 1 : 0;
  });
}
