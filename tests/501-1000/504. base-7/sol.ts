function convertToBase7(num: number): string {
  if (num === 0) {
    return "0";
  }
  const sign = num < 0 ? "-" : "";
  num = Math.abs(num);
  let result = "";
  while (num > 0) {
    result = (num % 7).toString() + result;
    num = Math.floor(num / 7);
  }
  return sign + result;
}
