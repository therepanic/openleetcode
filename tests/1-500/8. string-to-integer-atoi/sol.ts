function myAtoi(s: string): number {
  s = s.trimStart();
  if (s.length === 0) {
    return 0;
  }

  let sign = 1;
  let i = 0;
  if (s[0] === "-") {
    sign = -1;
    i++;
  } else if (s[0] === "+") {
    i++;
  }

  let res = 0;
  while (i < s.length) {
    const code = s.charCodeAt(i);
    if (code < 48 || code > 57) {
      break;
    }
    const digit = code - 48;
    if (sign === 1) {
      if (res > 214748364 || (res === 214748364 && digit > 7)) {
        return 2147483647;
      }
    } else {
      if (res > 214748364 || (res === 214748364 && digit > 8)) {
        return -2147483648;
      }
    }
    res = res * 10 + digit;
    i++;
  }

  return sign === 1 ? res : -res;
}
