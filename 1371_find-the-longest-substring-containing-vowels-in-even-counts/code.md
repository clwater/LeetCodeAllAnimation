# Find the Longest Substring Containing Vowels in Even Counts
# 每个元音包含偶数次的最长子字符串


## Description
Given the string s, return the size of the longest substring containing each vowel an even number of times. That is, 'a', 'e', 'i', 'o', and 'u' must appear an even number of times.


## Description
给你一个字符串 s ，请你返回满足以下条件的最长子字符串的长度：每个元音字母，即 'a'，'e'，'i'，'o'，'u' ，在子字符串中都恰好出现了偶数次.


## Example
### Example 1:
Input: s = "eleetminicoworoep"
Output: 13
Explanation: The longest substring is "leetminicowor" which contains two each of the vowels: e, i and o and zero of the vowels: a and u.

### Example 2:
Input: s = "leetcodeisgreat"
Output: 5
Explanation: The longest substring is "leetc" which contains two e's.

### Example 3:
Input: s = "bcbcbc"
Output: 6
Explanation: In this case, the given string "bcbcbc" is the longest because all vowels: a, e, i, o and u appear zero times.

## 示例
### 示例 1：
    输入：s = "eleetminicoworoep"
    输出：13
    解释：最长子字符串是 "leetminicowor" ，它包含 e，i，o 各 2 个，以及 0 个 a，u 。

### 示例 2：
    输入：s = "leetcodeisgreat"
    输出：5
    解释：最长子字符串是 "leetc" ，其中包含 2 个 e 。

### 示例 3：
    输入：s = "bcbcbc"
    输出：6
    解释：这个示例中，字符串 "bcbcbc" 本身就是最长的，因为所有的元音 a，e，i，o，u 都出现了 0 次。



### Note:
* 1 <= s.length <= 5 x 10^5
* s contains only lowercase English letters.

## 提示
* 1 <= s.length <= 5 x 10^5
* s 只包含小写英文字母。


## Solution
### 前缀和+状态压缩
这道题目是我认为含金量十分高的一道题目, 考察了很多的内容和它们的实际使用, 譬如前缀和, 状态压缩和位运算. 都是十分经典又实用的部分

### Code

```java
     //T O(n)
    //S O(S) S=32
    public int findTheLongestSubstring(String s) {
        //定义元音字符出现的情况(最多有2^5种情况, 32)
        int[] vowels = new int[1 << 5];

        //默认每种没出现的情况为-1
        Arrays.fill(vowels, -1);

        //定义返回结果及当前元音字符出现情况
        int result = 0, status = 0;

        vowels[0] = 0;

        //遍历数组
        for (int i = 0; i <  s.length(); i++) {
            //获取当前字符,
            char ch = s.charAt(i);
            //更新当前子字符串元音状态
            if (ch == 'a') {
                status ^= (1 << 0);
            } else if (ch == 'e') {
                status ^= (1 << 1);
            } else if (ch == 'i') {
                status ^= (1 << 2);
            } else if (ch == 'o') {
                status ^= (1 << 3);
            } else if (ch == 'u') {
                status ^= (1 << 4);
            }

            //查看当前状态是否出现
            if (vowels[status] >= 0) {
                //如果当前状态出现过则更新两次相同状态相隔距离和已有的情况
                result = Math.max(result, i + 1 - vowels[status]);
            } else {
                //如果此状态没有出现则更新其首次出现的位置
                vowels[status] = i + 1;
            }
        }
        return result;
    }
```