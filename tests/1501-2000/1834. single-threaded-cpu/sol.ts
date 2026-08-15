function getOrder(tasks: number[][]): number[] {
  const n = tasks.length;
  const indexed = tasks.map((task, i) => [task[0], task[1], i]);
  indexed.sort((a, b) => a[0] - b[0]);

  const result: number[] = [];
  const heap: [number, number][] = [];
  let time = 0;
  let idx = 0;

  function heapPush(item: [number, number]) {
    heap.push(item);
    heap.sort((a, b) => {
      if (a[0] !== b[0]) return a[0] - b[0];
      return a[1] - b[1];
    });
  }

  function heapPop(): [number, number] {
    return heap.shift()!;
  }

  while (idx < n || heap.length > 0) {
    if (heap.length === 0 && time < indexed[idx][0]) {
      time = indexed[idx][0];
    }

    while (idx < n && indexed[idx][0] <= time) {
      heapPush([indexed[idx][1], indexed[idx][2]]);
      idx++;
    }

    const [process, index] = heapPop();
    result.push(index);
    time += process;
  }

  return result;
}
