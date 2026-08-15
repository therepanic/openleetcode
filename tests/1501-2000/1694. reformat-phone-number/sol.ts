function reformatNumber(number: string): string {
  let phoneCleared = number.replace(/\D/g, "");
  const result: string[] = [];

  while (phoneCleared.length > 4) {
    result.push(phoneCleared.slice(0, 3));
    phoneCleared = phoneCleared.slice(3);
  }

  if (phoneCleared.length === 4) {
    result.push(phoneCleared.slice(0, 2));
    result.push(phoneCleared.slice(2));
  } else if (phoneCleared.length > 0) {
    result.push(phoneCleared);
  }

  return result.join("-");
}
