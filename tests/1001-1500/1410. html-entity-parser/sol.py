import re


class Solution:
    def entityParser(self, text: str) -> str:
        entities = {
            "&quot": '"',
            "&apos": "'",
            "&amp": "&",
            "&gt": ">",
            "&lt": "<",
            "&frasl": "/",
        }

        pattern = r"&[^;&\s]+;"

        def replacer(match):
            entity = match.group(0)[:-1]  # remove trailing ';'
            return entities.get(entity, match.group(0))

        return re.sub(pattern, replacer, text)
