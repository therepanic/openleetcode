function canReach(arr: number[], start: number): boolean {
  const seen = new Set<number>();
  const queue: number[] = [start];
  let head = 0;
  while (head < queue.length) {
    const index = queue[head];
    head++;
    if (index < 0 || index >= arr.length || seen.has(index)) {
      continue;
    }
    if (arr[index] === 0) {
      return true;
    }
    seen.add(index);
    queue.push(index + arr[index]);
    queue.push(index - arr[index]);
  }
  return false;
}
