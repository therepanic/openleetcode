class Solution(object):
    def getFolderNames(self, names):
        """
        :type names: List[str]
        :rtype: List[str]
        """
        name_count = dict()
        result = []

        for name in names:
            if name not in name_count:
                result.append(name)
                name_count[name] = 1
            else:
                k = name_count[name]
                while "%s(%d)" % (name, k) in name_count:
                    k += 1
                new_name = "%s(%d)" % (name, k)
                result.append(new_name)
                name_count[name] = k + 1
                name_count[new_name] = 1

        return result
