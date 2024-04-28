class Solution:
    def isPalindrome(self, x: int) -> bool:

        # negative int can never be palindrome
        if x < 0:
            return False

        digits = []
        while x > 0:
            digits.append(x % 10)
            x //= 10

        n = len(digits)
        for i in range(0, n // 2):
            if digits[i] != digits[n - 1 - i]:
                return False
        return True


s = Solution()
s.isPalindrome(121)
s.isPalindrome(10)
s.isPalindrome(-121)
