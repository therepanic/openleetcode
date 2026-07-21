function numTeams(rating: number[]): number {
  let total = 0;
  const n = rating.length;
  for (let j = 1; j < n - 1; j++) {
    let leftLess = 0;
    let leftGreater = 0;
    for (let i = 0; i < j; i++) {
      if (rating[i] < rating[j]) {
        leftLess++;
      } else if (rating[i] > rating[j]) {
        leftGreater++;
      }
    }

    let rightLess = 0;
    let rightGreater = 0;
    for (let k = j + 1; k < n; k++) {
      if (rating[k] < rating[j]) {
        rightLess++;
      } else if (rating[k] > rating[j]) {
        rightGreater++;
      }
    }

    total += leftLess * rightGreater + leftGreater * rightLess;
  }
  return total;
}
