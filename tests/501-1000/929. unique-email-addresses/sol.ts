function numUniqueEmails(emails: string[]): number {
  const res = new Set<string>();
  for (const email of emails) {
    const atIndex = email.indexOf("@");
    let local = email.substring(0, atIndex);
    const domain = email.substring(atIndex + 1);

    const plusIndex = local.indexOf("+");
    if (plusIndex !== -1) {
      local = local.substring(0, plusIndex);
    }
    local = local.replace(/\./g, "");
    res.add(local + "@" + domain);
  }
  return res.size;
}
