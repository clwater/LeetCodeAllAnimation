# Longest Substring Without Repeating Characters
# 无重复字符的最长子串

## Description
Given a string, find the length of the longest substring without repeating characters.

## Description
给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。

## Example
### Example 1:
    Input: "abcabcbb"
    Output: 3 
    Explanation: The answer is "abc", with the length of 3. 

### Example 2:
    Input: "bbbbb"
    Output: 1
    Explanation: The answer is "b", with the length of 1.

### Example 3:
    Input: "pwwkew"
    Output: 3
    Explanation: The answer is "wke", with the length of 3. 

## 示例
### 示例 1:
    输入: "abcabcbb"
    输出: 3 
    解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。

### 示例 2:
    输入: "bbbbb"
    输出: 1
    解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。

### 示例 3:
    输入: "pwwkew"
    输出: 3
    解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
         请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。

## Other
Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

## Solution
### 滑动窗口
我们再一个的字符串中找出从每一个字符开始的, 不包含重复字符的最长子串,那么其中最长的那个字符串即为答案


## Code 

```java
    //T O(n)
    //S O(n)
    public int lengthOfLongestSubstring(String s) {

        //记录相关元素的位置
        HashMap<Character, Integer> maps = new HashMap<>();
        //记录区间的开始和结束的位置
        int start = 0, end;
        //定义结果集
        int result = 0;

        //遍历数组
        for (int i = 0; i < s.length(); i++) {
            //移动结束位置
            end = i;
            //检查当前元素是否存在

            if (maps.containsKey(s.charAt(i))){
                //更新新的区间开始的位置
                start = Math.max(start, maps.get(s.charAt(i)) + 1);
            }
            //添加元素信息
            maps.put(s.charAt(i), i);
            //更新结果内容
            result = Math.max(result, end - start + 1);
        }

        return result;
    }
```