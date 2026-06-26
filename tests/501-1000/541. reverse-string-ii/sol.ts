function reverseStr(s: string, k: number): string {
  let arr = s.split("");
  const step = 2 * k;
  for (let i = 0; i < arr.length; i += step) {
    let start = i;
    let end = Math.min(i + k - 1, arr.length - 1);
    while (start < end) {
      let tmp = arr[start];
      arr[start] = arr[end];
      arr[end] = tmp;
      start++;
      end--;
    }
  }
  return arr.join("");
}
