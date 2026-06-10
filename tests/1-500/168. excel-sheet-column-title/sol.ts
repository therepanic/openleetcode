function convertToTitle(columnNumber: number): string {
  const chars: string[] = [];
  while (columnNumber > 0) {
    columnNumber--;
    chars.push(String.fromCharCode("A".charCodeAt(0) + (columnNumber % 26)));
    columnNumber = Math.floor(columnNumber / 26);
  }
  return chars.reverse().join("");
}
