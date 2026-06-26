class Solution(object):
    def findDuplicate(self, paths):
        d = {}
        for path in paths:
            parts = path.split(" ")
            directory = parts[0]
            for file in parts[1:]:
                name, content = file.split("(")
                content = content[:-1]
                full_path = directory + "/" + name
                d.setdefault(content, []).append(full_path)
        return [group for group in d.values() if len(group) > 1]
