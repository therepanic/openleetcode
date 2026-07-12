function maskPII(s: string): string {
  if (s.includes("@")) {
    const parts = s.split("@");
    let name = parts[0].toLowerCase();
    const domain = parts[1].toLowerCase();
    name = name[0] + "*****" + name[name.length - 1];
    return name + "@" + domain;
  } else {
    let gg = "";
    for (const x of s) {
      if (!isNaN(parseInt(x))) {
        gg += x;
      }
    }
    const l = gg.length;
    if (l > 10) {
      return "+" + "*".repeat(l - 10) + "-***-***-" + gg.slice(l - 4);
    }
    return "***-***-" + gg.slice(l - 4);
  }
}
