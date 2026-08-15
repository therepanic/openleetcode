function numberOfWeakCharacters(properties: number[][]): number {
  properties.sort((a, b) => (a[0] !== b[0] ? b[0] - a[0] : a[1] - b[1]));

  let maxDefense = 0;
  let weakCount = 0;

  for (const prop of properties) {
    if (prop[1] < maxDefense) {
      weakCount++;
    } else {
      maxDefense = prop[1];
    }
  }

  return weakCount;
}
