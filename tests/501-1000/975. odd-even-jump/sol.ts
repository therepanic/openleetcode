function oddEvenJumps(arr: number[]): number {
  const n = arr.length;
  const nextHigher: (number | null)[] = new Array(n).fill(null);
  const nextLower: (number | null)[] = new Array(n).fill(null);

  const indices = Array.from({ length: n }, (_, i) => i);
  indices.sort((a, b) => arr[a] - arr[b]);
  const stack: number[] = [];
  for (const i of indices) {
    while (stack.length > 0 && i > stack[stack.length - 1]) {
      nextHigher[stack.pop()!] = i;
    }
    stack.push(i);
  }

  indices.sort((a, b) => arr[b] - arr[a]);
  stack.length = 0;
  for (const i of indices) {
    while (stack.length > 0 && i > stack[stack.length - 1]) {
      nextLower[stack.pop()!] = i;
    }
    stack.push(i);
  }

  const odd: boolean[] = new Array(n).fill(false);
  const even: boolean[] = new Array(n).fill(false);
  odd[n - 1] = true;
  even[n - 1] = true;

  let result = 1;
  for (let i = n - 2; i >= 0; i--) {
    if (nextHigher[i] !== null) {
      odd[i] = even[nextHigher[i]!];
    }
    if (nextLower[i] !== null) {
      even[i] = odd[nextLower[i]!];
    }
    if (odd[i]) result++;
  }
  return result;
}
