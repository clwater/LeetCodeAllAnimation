# Longest Repeating Character Replacement
# 替换后的最长重复字符


## Description
Given a string s that consists of only uppercase English letters, you can perform at most k operations on that string.

In one operation, you can choose any character of the string and change it to any other uppercase English character.

Find the length of the longest sub-string containing all repeating letters you can get after performing the above operations.

## Description
给你一个仅由大写英文字母组成的字符串，你可以将任意位置上的字符替换成另外的字符，总共可最多替换 k 次。在执行上述操作后，找到包含重复字母的最长子串的长度。





## Example
### Example 1
    Input:
    s = "ABAB", k = 2

    Output:
    4

    Explanation:
    Replace the two 'A's with two 'B's or vice versa.

### Example 2
    Input:
    s = "AABABBA", k = 1

    Output:
    4

    Explanation:
    Replace the one 'A' in the middle with 'B' and form "AABBBBA".
    The substring "BBBB" has the longest repeating letters, which is 4.    

## 示例
### 示例1
    输入:
    s = "ABAB", k = 2

    输出:
    4

    解释:
    用两个'A'替换为两个'B',反之亦然。


### 示例 2:

    输入:
    s = "AABABBA", k = 1

    输出:
    4

    解释:
    将中间的一个'A'替换为'B',字符串变为 "AABBBBA"。
    子串 "BBBB" 有最长重复字母, 答案为 4。

### Note:
Both the string's length and k will not exceed 10^4.

## 注意
字符串长度 和 k 不会超过 10^4


## Solution
### 滑动窗口
当我们将k值取为0的时候, 这道题目就可以理解为寻找字符串中最长重复字串的问题, 所以这道题目我们仍可以通过滑动窗口来解决.

### Code

```java
    //T O(n)
    //S O(1)
    public int characterReplacement(String s, int k) {
        //记录当前窗口内字符出现的次数
        int[] chars = new int[256];
        //当前窗口的开始和结束位置
        int start = 0, end = 0;
        //当前窗口内重复字符的最大数量
        int windowMaxCharCount = 0;

        while (end < s.length()) {
            //更新字符出现的次数
            chars[s.charAt(end)]++;
            //更新当前数组内重复字符的最大数量
            windowMaxCharCount = Math.max(windowMaxCharCount, chars[s.charAt(end)]);
            //判断是否需要移动窗口开始位置
            //如当前窗口内最大的重复字符加上可替换字符仍不能超过当前窗口范围
            //则需要移动窗口开始位置
            if (windowMaxCharCount + k < end - start + 1) {
                chars[s.charAt(start)]--;
                start++;
            }
            end++;
        }
        return end - start;
    }
```