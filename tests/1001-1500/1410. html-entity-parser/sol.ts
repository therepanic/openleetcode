function entityParser(text: string): string {
  const entities: Record<string, string> = {
    "&quot": '"',
    "&apos": "'",
    "&amp": "&",
    "&gt": ">",
    "&lt": "<",
    "&frasl": "/",
  };

  const pattern = /&[^;&\s]+;/g;

  return text.replace(pattern, (match) => {
    const entity = match.slice(0, -1);
    return entities[entity] || match;
  });
}
