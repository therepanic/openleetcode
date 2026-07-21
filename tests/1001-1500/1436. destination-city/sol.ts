function destCity(paths: string[][]): string {
  const startCities = new Set<string>();

  for (const path of paths) {
    startCities.add(path[0]);
  }

  for (const path of paths) {
    if (!startCities.has(path[1])) {
      return path[1];
    }
  }

  return "";
}
