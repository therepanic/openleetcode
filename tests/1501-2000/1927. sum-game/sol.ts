function sumGame(num: string): boolean {
  const n = num.length;
  const half = Math.floor(n / 2);
  let sumLeft = 0,
    sumRight = 0;
  let qLeft = 0,
    qRight = 0;

  for (let i = 0; i < half; i++) {
    if (num[i] === "?") qLeft++;
    else sumLeft += parseInt(num[i]);
  }

  for (let i = half; i < n; i++) {
    if (num[i] === "?") qRight++;
    else sumRight += parseInt(num[i]);
  }

  return (sumLeft - sumRight) * 2 !== (qRight - qLeft) * 9;
}
