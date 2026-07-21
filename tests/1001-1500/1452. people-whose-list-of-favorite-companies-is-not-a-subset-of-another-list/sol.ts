function peopleIndexes(favoriteCompanies: string[][]): number[] {
  const sets: Set<string>[] = favoriteCompanies.map(
    (companies) => new Set(companies),
  );
  const result: number[] = [];

  for (let i = 0; i < sets.length; i++) {
    let isSubset = false;
    for (let j = 0; j < sets.length; j++) {
      if (i !== j) {
        let allFound = true;
        for (const company of sets[i]) {
          if (!sets[j].has(company)) {
            allFound = false;
            break;
          }
        }
        if (allFound) {
          isSubset = true;
          break;
        }
      }
    }
    if (!isSubset) {
      result.push(i);
    }
  }

  return result;
}
