function numberOfRounds(loginTime: string, logoutTime: string): number {
  const toMinutes = (t: string): number => {
    const [h, m] = t.split(":").map(Number);
    return h * 60 + m;
  };

  let start = toMinutes(loginTime);
  let end = toMinutes(logoutTime);

  if (end < start) {
    end += 24 * 60;
  }

  const startRound = Math.floor((start + 14) / 15);
  const endRound = Math.floor(end / 15);

  return Math.max(0, endRound - startRound);
}
