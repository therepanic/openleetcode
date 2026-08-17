function containsPattern(arr: number[], m: number, k: number): boolean {
  for (let i = 0; i <= arr.length - m * k; i++) {
    let match = true;
    for (let j = 0; j < m * (k - 1); j++) {
      if (arr[i + j] !== arr[i + j + m]) {
        match = false;
        break;
      }
    }
    if (match) return true;
  }
  return false;
}
