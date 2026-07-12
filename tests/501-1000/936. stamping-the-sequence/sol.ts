function movesToStamp(stamp: string, target: string): number[] {
  const m = stamp.length;
  const n = target.length;
  const stampArr = stamp.split("");
  const targetArr = target.split("");

  const canStamp = (i: number): boolean => {
    for (let j = 0; j < m; j++) {
      if (targetArr[i + j] !== "?" && targetArr[i + j] !== stampArr[j]) {
        return false;
      }
    }
    return true;
  };

  const applyStamp = (i: number): void => {
    for (let j = 0; j < m; j++) {
      targetArr[i + j] = "?";
    }
  };

  const stamped: boolean[] = new Array(n).fill(false);
  const result: number[] = [];
  const queue: number[] = [];

  for (let i = 0; i <= n - m; i++) {
    if (canStamp(i)) {
      applyStamp(i);
      queue.push(i);
      result.push(i);
      stamped[i] = true;
    }
  }

  while (queue.length > 0) {
    const pos = queue.shift()!;
    const start = Math.max(0, pos - m + 1);
    const end = Math.min(n - m, pos + m);
    for (let i = start; i <= end; i++) {
      if (canStamp(i)) {
        if (!stamped[i]) {
          applyStamp(i);
          queue.push(i);
          result.push(i);
          stamped[i] = true;
        }
      }
    }
  }

  if (targetArr.every((c) => c === "?")) {
    return result.reverse();
  }
  return [];
}
