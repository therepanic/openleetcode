function maxDiff(num: number): number {
  const numStr = num.toString();
  const uniqueDigits = new Set(numStr.split(""));
  let maxVal = num;
  let minVal = num;

  for (const digit of uniqueDigits) {
    for (let newDigitCode = 48; newDigitCode <= 57; newDigitCode++) {
      const newDigit = String.fromCharCode(newDigitCode);
      if (numStr[0] === digit && newDigit === "0") {
        continue;
      }
      const newNumStr = numStr.split(digit).join(newDigit);
      const newNum = parseInt(newNumStr, 10);
      maxVal = Math.max(maxVal, newNum);
      minVal = Math.min(minVal, newNum);
    }
  }

  return maxVal - minVal;
}
