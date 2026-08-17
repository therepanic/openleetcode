function removeOccurrences(s: string, part: string): string {
  const result_stack: string[] = [];
  const target_length = part.length;
  const target_end_char = part[target_length - 1];

  for (const current_char of s) {
    result_stack.push(current_char);

    if (
      current_char === target_end_char &&
      result_stack.length >= target_length
    ) {
      if (
        result_stack.slice(result_stack.length - target_length).join("") ===
        part
      ) {
        result_stack.splice(result_stack.length - target_length, target_length);
      }
    }
  }

  return result_stack.join("");
}
