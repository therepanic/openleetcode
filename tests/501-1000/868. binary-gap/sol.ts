function binaryGap(n: number): number {
  let maxDist = 0;
  let currDist = 0;
  let foundFirstOne = false;

  while (n > 0) {
    const bit = n % 2;

    if (bit === 1) {
      if (foundFirstOne) {
        maxDist = Math.max(maxDist, currDist);
      }

      currDist = 1;
      foundFirstOne = true;
    } else {
      if (foundFirstOne) {
        currDist++;
      }
    }

    n = Math.floor(n / 2);
  }

  return maxDist;
}
