function alertNames(keyName: string[], keyTime: string[]): string[] {
  const map = new Map<string, number[]>();

  for (let i = 0; i < keyName.length; i++) {
    const parts = keyTime[i].split(":");
    const minutes = parseInt(parts[0]) * 60 + parseInt(parts[1]);
    if (!map.has(keyName[i])) {
      map.set(keyName[i], []);
    }
    map.get(keyName[i])!.push(minutes);
  }

  const result: string[] = [];

  for (const [name, times] of map) {
    times.sort((a, b) => a - b);
    for (let i = 0; i < times.length - 2; i++) {
      if (times[i + 2] - times[i] <= 60) {
        result.push(name);
        break;
      }
    }
  }

  return result.sort();
}
