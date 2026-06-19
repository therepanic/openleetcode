function addStrings(num1: string, num2: string): string {
  const result: string[] = [];
  let carry = 0;
  let i = num1.length - 1,
    j = num2.length - 1;

  while (i >= 0 || j >= 0 || carry > 0) {
    const digit1 = i >= 0 ? num1.charCodeAt(i) - "0".charCodeAt(0) : 0;
    const digit2 = j >= 0 ? num2.charCodeAt(j) - "0".charCodeAt(0) : 0;

    const total = digit1 + digit2 + carry;
    carry = Math.floor(total / 10);
    result.push(String.fromCharCode((total % 10) + "0".charCodeAt(0)));

    i--;
    j--;
  }

  return result.reverse().join("");
}
