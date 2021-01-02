class Solution:
    def longestCommonPrefix(self, strs) -> str:
        if not strs:
            return ""
        prefix = strs[0]
        for s in strs:
            if not prefix:
                return prefix
            prefix = prefix[: len(s)]
            for i, c in enumerate(s):
                if i >= len(prefix):
                    break
                if prefix[i] != c:
                    prefix = s[:i]
                    if not prefix:
                        return prefix
                    break
        print(prefix)
        return prefix


s = Solution()
s.longestCommonPrefix(["flower", "flow", "flight"])
s.longestCommonPrefix(["dog", "racecar", "car"])
s.longestCommonPrefix(["ab", "a"])
s.longestCommonPrefix(["aaa", "aa", "aaa"])

