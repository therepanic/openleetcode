function minimumTeachings(
  n: number,
  languages: number[][],
  friendships: number[][],
): number {
  const usersToTeach = new Set<number>();

  for (const friendship of friendships) {
    const user1 = friendship[0] - 1;
    const user2 = friendship[1] - 1;
    let canCommunicate = false;
    for (const lang1 of languages[user1]) {
      if (languages[user2].includes(lang1)) {
        canCommunicate = true;
        break;
      }
    }
    if (!canCommunicate) {
      usersToTeach.add(user1);
      usersToTeach.add(user2);
    }
  }

  let minUsers = languages.length + 1;
  for (let language = 1; language <= n; language++) {
    let count = 0;
    for (const user of usersToTeach) {
      if (!languages[user].includes(language)) {
        count++;
      }
    }
    minUsers = Math.min(minUsers, count);
  }
  return minUsers;
}
