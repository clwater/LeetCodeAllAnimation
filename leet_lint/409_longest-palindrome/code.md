# Longest Palindrome
# 最长回文串

## Description
Given a string s which consists of lowercase or uppercase letters, return the length of the longest palindrome that can be built with those letters.

Letters are case sensitive, for example, "Aa" is not considered a palindrome here.

## Description
给定一个包含大写字母和小写字母的字符串，找到通过这些字母构造成的最长的回文串。

在构造过程中，请注意区分大小写。比如 "Aa" 不能当做一个回文字符串。

注意:
假设字符串的长度不会超过 1010。

## Example
### Example 1:
    Input: s = "abccccdd"
    Output: 7
    Explanation:
    One longest palindrome that can be built is "dccaccd", whose length is 7.

### Example 2:
    Input: s = "a"
    Output: 1

### Example 3:
    Input: s = "bb"
    Output: 2

## 示例
### 示例 1:
    输入:
        "abccccdd"
    输出:
        7
    解释:
        我们可以构造的最长的回文串是"dccaccd", 它的长度是 7。

## Constraints:
* 1 <= s.length <= 2000
* s consits of lower-case and/or upper-case English letters only.


## Solution
### 贪心
这道题目我们可以通过贪心的方式来解决, 这里我们认为如果某处两侧的文字都是关于某处对称的, 则认为是一个回文字串.

### Code

```java
    //T: O(n)
    //S: O(n)
    public int longestPalindrome(String s) {
        //此处可以用HashMap优化需要空间
        int[] chars = new int[128];

        //初始化数组
        for(char c : s.toCharArray()){
            chars[c]++;
        }

        int result = 0;

        //遍历相关内容
        for (int index : chars){

            //统计最大的偶数情况
            result += index / 2 * 2;

            //如果当前中心字符非出现次数为奇数的字符(总长度为偶数),
            //并且当前遍历的数字为奇数, 则在输出的中心放入一个奇数的数字
            if (result % 2 == 0 && index % 2 == 1){
                result++;
            }
        }

        return result;
    }
```