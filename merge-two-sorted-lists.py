# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def mergeTwoLists(self, l1, l2):
        c = []
        print(l1)
        while l1.next or l2.next:
            if not l1.next:
                
        # while l1 or l2:
        #     if not l1:
        #         c.append(l2.pop(0))
        #     elif not l2:
        #         c.append(l1.pop(0))
        #     elif l1[0] < l2[0]:
        #         c.append(l1.pop(0))
        #     else:
        #         c.append(l2.pop(0))
        print(c)
        return c









# # Definition for singly-linked list.
# # class ListNode:
# #     def __init__(self, val=0, next=None):
# #         self.val = val
# #         self.next = next
# class Solution:
#     def mergeTwoLists(self, l1, l2):
#         c = []
#         while l1 or l2:
#             if not l1:
#                 c.append(l2.pop(0))
#             elif not l2:
#                 c.append(l1.pop(0))
#             elif l1[0] < l2[0]:
#                 c.append(l1.pop(0))
#             else:
#                 c.append(l2.pop(0))
#         print(c)
#         return c


# s = Solution()

# l1 = [1, 2, 4]
# l2 = [1, 3, 4]

# s.mergeTwoLists(l1, l2)
