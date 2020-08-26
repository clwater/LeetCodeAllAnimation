# Decode String
# 字符串解码

## Description
Given an encoded string, return its decoded string.
The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is being repeated exactly k times. Note that k is guaranteed to be a positive integer.
You may assume that the input string is always valid; No extra white spaces, square brackets are well-formed, etc.
Furthermore, you may assume that the original data does not contain any digits and that digits are only for those repeat numbers, k. For example, there won't be input like 3a or 2[4].

## Description
给定一个经过编码的字符串，返回它解码后的字符串。
编码规则为: k[encoded_string]，表示其中方括号内部的 encoded_string 正好重复 k 次。注意 k 保证为正整数。
你可以认为输入字符串总是有效的；输入字符串中没有额外的空格，且输入的方括号总是符合格式要求的。
此外，你可以认为原始数据不包含数字，所有的数字只表示重复的次数 k ，例如不会出现像 3a 或 2[4] 的输入。

## Example
### Example 1:
    Input: s = "3[a]2[bc]"
    Output: "aaabcbc"

### Example 2:
    Input: s = "3[a2[c]]"
    Output: "accaccacc"

### Example 3:
    Input: s = "2[abc]3[cd]ef"
    Output: "abcabccdcdcdef"

### Example 4:
    Input: s = "abc3[cd]xyz"
    Output: "abccdcdcdxyz"

## 示例
### 示例 1：
    输入：s = "3[a]2[bc]"
    输出："aaabcbc"

### 示例 2：
    输入：s = "3[a2[c]]"
    输出："accaccacc"

### 示例 3：
    输入：s = "2[abc]3[cd]ef"
    输出："abcabccdcdcdef"

### 示例 4：
    输入：s = "abc3[cd]xyz"
    输出："abccdcdcdxyz"



## Solution
### 栈
数字存放在数字栈,字符串存放在字符串栈,遇到右括号时候弹出一个数字栈,字母栈弹到左括号为止.


## Code 

```java
 //T O(n)
    //S O(n)
    public String decodeString(String s) {
        //结果/字母状态缓存集
        StringBuffer result = new StringBuffer();
        //数字栈 - 记录当前处理字符应该重复次数
        Stack<Integer> nums = new Stack<>();
        //字母栈 - 记录当前处理之前的字符
        Stack<StringBuffer> words = new Stack<>();

        //重复数字记录
        int num = 0;
        for (char c : s.toCharArray()) {
            //当前是数字
            if (Character.isDigit(c)) {
                //更新当前数字情况
                num = num * 10 + c - '0';
            //当前是字母
            } else if (Character.isAlphabetic(c)) {
                //加入结果集中
                result.append(c);
            //当前是'['
            } else if (c == '[') {
                //数字和字母入栈
                words.add(result);
                nums.add(num);
                //更新字母状态和数字
                result = new StringBuffer();
                num = 0;

            //其它, 当前为']'
            } else {
                //获取当前取值之前的内容
                StringBuffer tempWord = words.pop();
                //获取当前取值重复次数
                int tempNum = nums.pop();
                //更新结果内容
                for (int i = 0; i < tempNum; i++) {
                    tempWord.append(result);
                }
                result = tempWord;
            }
        }
        return result.toString();
    }

```