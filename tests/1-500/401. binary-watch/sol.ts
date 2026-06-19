function readBinaryWatch(turnedOn: number): string[] {
  const result: string[] = [];
  for (let hour = 0; hour < 12; hour++) {
    for (let minute = 0; minute < 60; minute++) {
      const hourBits = hour.toString(2).split("0").join("").length;
      const minuteBits = minute.toString(2).split("0").join("").length;
      if (hourBits + minuteBits === turnedOn) {
        result.push(`${hour}:${minute.toString().padStart(2, "0")}`);
      }
    }
  }
  return result;
}
