function maximumSwap(num: number): number {
  const numList = num.toString().split("");
  const lastIndex: { [key: number]: number } = {};
  for (let i = 0; i < numList.length; i++) {
    lastIndex[parseInt(numList[i])] = i;
  }
  for (let i = 0; i < numList.length; i++) {
    const d = parseInt(numList[i]);
    for (let x = 9; x > d; x--) {
      if (lastIndex[x] !== undefined && lastIndex[x] > i) {
        [numList[i], numList[lastIndex[x]]] = [
          numList[lastIndex[x]],
          numList[i],
        ];
        return parseInt(numList.join(""));
      }
    }
  }
  return num;
}
