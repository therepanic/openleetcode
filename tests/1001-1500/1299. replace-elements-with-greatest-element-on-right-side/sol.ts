function replaceElements(arr: number[]): number[] {
  let maxElement: number = -1;
  for (let i = arr.length - 1; i >= 0; i--) {
    let temp = arr[i];
    arr[i] = maxElement;
    maxElement = Math.max(maxElement, temp);
  }
  return arr;
}
