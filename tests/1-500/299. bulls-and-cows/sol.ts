function getHint(secret: string, guess: string): string {
  let bulls = 0;
  const secretCounts: number[] = new Array(10).fill(0);
  const guessCounts: number[] = new Array(10).fill(0);

  for (let i = 0; i < secret.length; i++) {
    const s = secret[i];
    const g = guess[i];
    if (s === g) {
      bulls++;
    } else {
      secretCounts[parseInt(s)]++;
      guessCounts[parseInt(g)]++;
    }
  }

  let cows = 0;
  for (let i = 0; i < 10; i++) {
    cows += Math.min(secretCounts[i], guessCounts[i]);
  }
  return `${bulls}A${cows}B`;
}
