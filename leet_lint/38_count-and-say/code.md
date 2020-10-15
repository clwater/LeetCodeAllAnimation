# Count and Say
# 外观数列

## Description
The count-and-say sequence is the sequence of integers with the first five terms as following:

    1.     1
    2.     11
    3.     21
    4.     1211
    5.     111221
1 is read off as "one 1" or 11.
11 is read off as "two 1s" or 21.
21 is read off as "one 2, then one 1" or 1211.

Given an integer n where 1 ≤ n ≤ 30, generate the nth term of the count-and-say sequence. You can do so recursively, in other words from the previous member read off the digits, counting the number of digits in groups of the same digit.

Note: Each term of the sequence of integers will be represented as a string.


## Description
给定一个正整数 n（1 ≤ n ≤ 30），输出外观数列的第 n 项。

注意：整数序列中的每一项将表示为一个字符串。

「外观数列」是一个整数序列，从数字 1 开始，序列中的每一项都是对前一项的描述。前五项如下：

    1.     1
    2.     11
    3.     21
    4.     1211
    5.     111221

第一项是数字 1
描述前一项，这个数是 1 即 “一个 1 ”，记作 11
描述前一项，这个数是 11 即 “两个 1 ” ，记作 21
描述前一项，这个数是 21 即 “一个 2 一个 1 ” ，记作 1211
描述前一项，这个数是 1211 即 “一个 1 一个 2 两个 1 ” ，记作 111221



## Example
### Example 1:
    Input: 1
    Output: "1"
    Explanation: This is the base case.

### Example 2:
    Input: 4
    Output: "1211"
    Explanation: For n = 3 the term was "21" in which we have two groups "2" and "1", "2" can be read as "12" which means frequency = 1 and value = 2, the same way "1" is read as "11", so the answer is the concatenation of "12" and "11" which is "1211".

## 示例
### 示例 1:
    输入: 1
    输出: "1"
    解释：这是一个基本样例。

### 示例 2:
    输入: 4
    输出: "1211"
    解释：当 n = 3 时，序列是 "21"，其中我们有 "2" 和 "1" 两组，"2" 可以读作 "12"，也就是出现频次 = 1 而 值 = 2；类似 "1" 可以读作 "11"。所以答案是 "12" 和 "11" 组合在一起，也就是 "1211"。

## Solution
### 迭代模拟
这是针对外观数列的实现,外观数列本身也是一个很经典并应用广泛的数列, 这里我们使用迭代来模拟外观数列的实现

### Code

```java
      //T O(n * 2^n)
    //S O(1)
    public String countAndSay(int n) {
        //默认第一层为1
        String s = "1";
        //依次获取当前层数的内容
        for (int i = 1; i < n; i++) {
            s = say(s);
        }
        return s;
    }

    private String say(String say) {
        StringBuilder sb = new StringBuilder();
        //依次尝试说出上一行的情况
        for (int i = 0; i < say.length(); ) {
            int j = 0;
            //获取判断当前位置数字的重复情况
            while (
                    i + j < say.length()
                            && say.charAt(i + j) == say.charAt(i)
            ) {
                j++;
            }
            //描述当前重复的情况
            sb.append(j).append(say.charAt(i));
            //更新字符的位置
            i += j;
        }
        return sb.toString();
    }
```