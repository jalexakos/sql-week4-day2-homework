# Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
# Note: For the purpose of this problem, we define empty string as valid palindrome.
# Example 1:
# Input: "A man, a plan, a canal: Panama"
# Output: true
# Example 2:
# Input: "race a car"
# Output: false

import re

def is_palindrome(str1):
    str1 = str1.lower().strip()
    pattern = re.compile('[a-z]*')
    str_list = pattern.findall(str1)
    str2 = "".join(str_list)
    if str2 == str2[::-1]:
        return True
    else:
        return False

print(is_palindrome("A man, a plan, a canal: Panama"))
print(is_palindrome("race a car"))
print(is_palindrome("Mr. Owl ate my metal worm"))
print(is_palindrome("Do geese see God?"))
print(is_palindrome("Was it a car or a cat I saw?"))
print(is_palindrome(""))

# Brian's solution:

def isPal(s):
    s_as_lst = [x.lower() for x in s if x.isalnum()]
    return s_as_lst == s_as_lst[::-1]
isPal("A man, a plan, a canal: Panama")