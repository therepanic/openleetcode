function restoreIpAddresses(s: string): string[] {
  const result: string[] = [];
  const parts: string[] = [];

  const isValid = (segment: string): boolean => {
    if (segment.length > 1 && segment[0] === "0") {
      return false;
    }
    return Number(segment) <= 255;
  };

  const backtrack = (index: number): void => {
    if (parts.length === 4) {
      if (index === s.length) {
        result.push(parts.join("."));
      }
      return;
    }

    for (let length = 1; length <= 3 && index + length <= s.length; length++) {
      const segment = s.slice(index, index + length);
      if (isValid(segment)) {
        parts.push(segment);
        backtrack(index + length);
        parts.pop();
      }
    }
  };

  backtrack(0);
  return result;
}
