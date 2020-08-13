# Greatest Common Divisor of Strings
# 字符串的最大公因子

## Description
For strings S and T, we say "T divides S" if and only if S = T + ... + T  (T concatenated with itself 1 or more times)

Return the largest string X such that X divides str1 and X divides str2.


## Description
对于字符串 S 和 T，只有在 S = T + ... + T（T 与自身连接 1 次或多次）时，我们才认定 “T 能除尽 S”。

返回最长字符串 X，要求满足 X 能除尽 str1 且 X 能除尽 str2。

## Example
### Example 1:
    Input: str1 = "ABCABC", str2 = "ABC"
    Output: "ABC"

### Example 2:
    Input: str1 = "ABABAB", str2 = "ABAB"
    Output: "AB"

### Example 3:
    Input: str1 = "LEET", str2 = "CODE"
    Output: ""

## 示例
### 示例 1：
    输入：str1 = "ABCABC", str2 = "ABC"
    输出："ABC"

### 示例 2：
    输入：str1 = "ABABAB", str2 = "ABAB"
    输出："AB"

### 示例 3：
    输入：str1 = "LEET", str2 = "CODE"
    输出：""


### Note:
1. 1 <= str1.length <= 1000
2. 1 <= str2.length <= 1000
3. str1[i] and str2[i] are English uppercase letters.

## 提示
1. 1 <= str1.length <= 1000
2. 1 <= str2.length <= 1000
3. str1[i] 和 str2[i] 为大写英文字母


## Solution
### 枚举+公约数
我们可以很容易的想到最大公约数的解法, 这里我们参考最大公约数的解法对我们枚举过程进行优化

### Code

```java
    //T O(n)
    //S O(n)
    public String gcdOfStrings(String str1, String str2) {
        //判断两个字符串是否存在最大公因子
        if (!(str1 + str2).equals(str2 + str1)) {
            return "";
        }

        //返回最大公因数对应的长度
        return str1.substring(0, euclideanAlgorithm(str1.length(), str2.length()));
    }

    //辗转相除法获取两数最大公约数
    private int euclideanAlgorithm(int m, int n) {
        if (n == 0) {
            return m;
        } else {
            return euclideanAlgorithm(n, m % n);
        }
    }

```