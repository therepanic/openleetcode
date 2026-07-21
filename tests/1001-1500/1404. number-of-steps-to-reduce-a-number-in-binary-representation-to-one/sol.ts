function numSteps(s: string): number {
  let steps = 0;
  let carry = 0;

  for (let i = s.length - 1; i > 0; i--) {
    const bit = parseInt(s[i]) + carry;

    if (bit === 1) {
      steps += 2;
      carry = 1;
    } else {
      steps += 1;
    }
  }

  return steps + carry;
}
