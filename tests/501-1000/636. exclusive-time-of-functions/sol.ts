function exclusiveTime(n: number, logs: string[]): number[] {
  const callstack: number[][] = [];
  const exectime: number[] = new Array(n).fill(0);

  for (const log of logs) {
    const parts = log.split(":");
    const idn = parseInt(parts[0]);
    const status = parts[1];
    const curtime = parseInt(parts[2]);

    if (status === "start") {
      callstack.push([idn, curtime]);
    } else {
      const top = callstack.pop()!;
      const x = top[0];
      const y = top[1];
      const time = curtime - y + 1;
      exectime[x] += time;
      if (callstack.length > 0) {
        const prev = callstack[callstack.length - 1][0];
        exectime[prev] -= time;
      }
    }
  }

  return exectime;
}
