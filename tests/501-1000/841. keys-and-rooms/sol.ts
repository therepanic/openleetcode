function canVisitAllRooms(rooms: number[][]): boolean {
  const n = rooms.length;
  const keys: number[] = [0];
  const visited: boolean[] = new Array(n).fill(false);
  visited[0] = true;
  let count = 1;
  while (keys.length > 0) {
    const room = keys.pop()!;
    for (const i of rooms[room]) {
      if (!visited[i]) {
        visited[i] = true;
        keys.push(i);
        count++;
      }
    }
  }
  return count === n;
}
