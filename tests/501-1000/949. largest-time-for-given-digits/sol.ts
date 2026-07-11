function largestTimeFromDigits(arr: number[]): string {
  const permList: number[][] = [];
  permute(arr, 0, permList);

  let bestTime = -1;
  let bestIdx = -1;

  for (let i = 0; i < permList.length; i++) {
    const perm = permList[i];
    const hours = perm[0] * 10 + perm[1];
    const minutes = perm[2] * 10 + perm[3];

    if (hours < 24 && minutes < 60) {
      const currTime = hours * 60 + minutes;
      if (currTime > bestTime) {
        bestTime = currTime;
        bestIdx = i;
      }
    }
  }

  if (bestIdx === -1) return "";

  const res = permList[bestIdx];
  return `${res[0]}${res[1]}:${res[2]}${res[3]}`;
}

function permute(arr: number[], start: number, result: number[][]): void {
  if (start === arr.length) {
    result.push([...arr]);
    return;
  }
  for (let i = start; i < arr.length; i++) {
    [arr[start], arr[i]] = [arr[i], arr[start]];
    permute(arr, start + 1, result);
    [arr[start], arr[i]] = [arr[i], arr[start]];
  }
}
