function maximumBinaryString(binary: string): string {
  const n = binary.length;
  const z = binary.split("").filter((c) => c === "0").length;

  if (z < 2) return binary;

  const firstZero = binary.indexOf("0");
  const p = firstZero + z - 1;

  return "1".repeat(p) + "0" + "1".repeat(n - p - 1);
}
