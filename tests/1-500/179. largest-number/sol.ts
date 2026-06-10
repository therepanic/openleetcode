function largestNumber(nums: number[]): string {
  const parts = nums.map((num) => String(num));
  parts.sort((a, b) => {
    const ab = a + b;
    const ba = b + a;
    if (ab > ba) return -1;
    if (ab < ba) return 1;
    return 0;
  });
  if (parts.length > 0 && parts[0] === "0") return "0";
  return parts.join("");
}
