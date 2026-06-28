function scheduleCourse(courses: number[][]): number {
  courses.sort((a, b) => (a[1] === b[1] ? a[0] - b[0] : a[1] - b[1]));
  const maxHeap = new MaxHeap<number>();
  let days = 0;
  for (const [duration, last] of courses) {
    days += duration;
    maxHeap.push(duration);
    if (days > last) {
      const top = maxHeap.pop()!;
      days -= top;
    }
  }
  return maxHeap.size();
}

class MaxHeap<T> {
  private heap: T[] = [];

  push(val: T) {
    this.heap.push(val);
    this.bubbleUp(this.heap.length - 1);
  }

  pop(): T | undefined {
    if (this.heap.length === 0) return undefined;
    if (this.heap.length === 1) return this.heap.pop();
    const root = this.heap[0];
    this.heap[0] = this.heap.pop()!;
    this.bubbleDown(0);
    return root;
  }

  size(): number {
    return this.heap.length;
  }

  private bubbleUp(index: number) {
    while (index > 0) {
      const parentIndex = Math.floor((index - 1) / 2);
      if (this.heap[parentIndex] < this.heap[index]) {
        [this.heap[parentIndex], this.heap[index]] = [
          this.heap[index],
          this.heap[parentIndex],
        ];
        index = parentIndex;
      } else {
        break;
      }
    }
  }

  private bubbleDown(index: number) {
    const length = this.heap.length;
    while (true) {
      let largest = index;
      const left = 2 * index + 1;
      const right = 2 * index + 2;
      if (left < length && this.heap[left] > this.heap[largest]) {
        largest = left;
      }
      if (right < length && this.heap[right] > this.heap[largest]) {
        largest = right;
      }
      if (largest === index) break;
      [this.heap[index], this.heap[largest]] = [
        this.heap[largest],
        this.heap[index],
      ];
      index = largest;
    }
  }
}
