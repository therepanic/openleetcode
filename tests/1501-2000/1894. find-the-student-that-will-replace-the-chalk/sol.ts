function chalkReplacer(chalk: number[], k: number): number {
  const total = chalk.reduce((a, b) => a + b, 0);
  let remaining = k % total;
  for (let i = 0; i < chalk.length; i++) {
    if (remaining < chalk[i]) return i;
    remaining -= chalk[i];
  }
  return 0;
}
