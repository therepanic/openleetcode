function findDifferentBinaryString(nums: string[]): string {
  return nums.map((s, i) => (s[i] === "0" ? "1" : "0")).join("");
}
