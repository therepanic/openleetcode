function threeEqualParts(arr: number[]): number[] {
  const ones = arr.reduce((s, x) => s + x, 0);
  if (ones === 0) {
    return [0, arr.length - 1];
  }
  if (ones % 3 !== 0) {
    return [-1, -1];
  }

  const target = ones / 3;
  let first = -1;
  let second = -1;
  let third = -1;
  let seen = 0;

  for (let i = 0; i < arr.length; i++) {
    if (arr[i] === 1) {
      seen++;
      if (seen === 1) {
        first = i;
      } else if (seen === target + 1) {
        second = i;
      } else if (seen === 2 * target + 1) {
        third = i;
      }
    }
  }

  const len = arr.length - third;
  if (first + len <= second && second + len <= third) {
    for (let offset = 0; offset < len; offset++) {
      if (
        arr[first + offset] !== arr[second + offset] ||
        arr[first + offset] !== arr[third + offset]
      ) {
        return [-1, -1];
      }
    }
    return [first + len - 1, second + len];
  }
  return [-1, -1];
}
