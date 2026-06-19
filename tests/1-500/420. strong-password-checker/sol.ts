function strongPasswordChecker(password: string): number {
  const lowercase = new Set("abcdefghijklmnopqrstuvwxyz");
  const uppercase = new Set("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
  const digit = new Set("0123456789");

  const characters = new Set(password);

  const needsLowercase = ![...characters].some((c) => lowercase.has(c));
  const needsUppercase = ![...characters].some((c) => uppercase.has(c));
  const needsDigit = ![...characters].some((c) => digit.has(c));
  const numRequiredTypeReplaces =
    (needsLowercase ? 1 : 0) + (needsUppercase ? 1 : 0) + (needsDigit ? 1 : 0);

  const numRequiredInserts = Math.max(0, 6 - password.length);
  const numRequiredDeletes = Math.max(0, password.length - 20);

  const groups: number[] = [];
  if (password.length > 0) {
    let count = 1;
    for (let i = 1; i < password.length; i++) {
      if (password[i] === password[i - 1]) {
        count++;
      } else {
        groups.push(count);
        count = 1;
      }
    }
    groups.push(count);
  }

  for (let d = 0; d < numRequiredDeletes; d++) {
    let argmin = -1;
    let minVal = Infinity;
    for (let i = 0; i < groups.length; i++) {
      const group = groups[i];
      const val = group >= 3 ? group % 3 : 10 - group;
      if (val < minVal) {
        minVal = val;
        argmin = i;
      }
    }
    if (argmin !== -1) {
      groups[argmin]--;
    }
  }

  const numRequiredGroupReplaces = groups.reduce(
    (sum, group) => sum + Math.floor(group / 3),
    0,
  );

  return (
    numRequiredDeletes +
    Math.max(
      numRequiredTypeReplaces,
      numRequiredGroupReplaces,
      numRequiredInserts,
    )
  );
}
