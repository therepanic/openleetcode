function checkIfExist(arr: number[]): boolean {
  if (arr.filter((x) => x === 0).length >= 2) return true;

  for (const i of arr) {
    if (i !== 0 && arr.includes(i * 2)) {
      return true;
    }
  }
  return false;
}
