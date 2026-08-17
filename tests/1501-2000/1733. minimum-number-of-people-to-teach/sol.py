class Solution:
    def minimumTeachings(self, n, languages, friendships):
        users_to_teach = set()

        # Step 1: Identify users who can't communicate
        for user1, user2 in friendships:
            user1 -= 1  # Convert to 0-based index
            user2 -= 1
            can_communicate = False

            for lang1 in languages[user1]:
                if lang1 in languages[user2]:
                    can_communicate = True
                    break

            if not can_communicate:
                users_to_teach.add(user1)
                users_to_teach.add(user2)

        # Step 2: Try teaching each language
        min_users_to_teach = len(languages) + 1

        for language in range(1, n + 1):
            count = 0
            for user in users_to_teach:
                if language not in languages[user]:
                    count += 1
            min_users_to_teach = min(min_users_to_teach, count)

        return min_users_to_teach
