function minOperations(logs: string[]): number {
  let output = 0;
  for (let log of logs) {
    if (log === "../") {
      output--;
      if (output < 0) output = 0;
    } else if (log === "./") {
      continue;
    } else {
      output++;
    }
  }
  return output < 0 ? 0 : output;
}
