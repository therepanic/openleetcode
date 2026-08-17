function decode(encoded: number[], first: number): number[] {
  const arr = [first];
  for (let e of encoded) {
    arr.push(arr[arr.length - 1] ^ e);
  }
  return arr;
}
