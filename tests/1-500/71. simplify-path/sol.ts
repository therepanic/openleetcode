function simplifyPath(path: string): string {
  const parts: string[] = [];
  for (const part of path.split("/")) {
    if (part === "" || part === ".") continue;
    if (part === "..") {
      if (parts.length > 0) parts.pop();
    } else {
      parts.push(part);
    }
  }
  return "/" + parts.join("/");
}
