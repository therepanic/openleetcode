function interpret(command: string): string {
  let result = "";
  let i = 0;
  while (i < command.length) {
    if (command[i] === "G") {
      result += "G";
      i++;
    } else if (command.substring(i, i + 2) === "()") {
      result += "o";
      i += 2;
    } else {
      result += "al";
      i += 4;
    }
  }
  return result;
}
