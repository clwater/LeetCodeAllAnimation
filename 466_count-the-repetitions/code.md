# Count The Repetitions
# 统计重复个数

## Description
Define S = [s,n] as the string S which consists of n connected strings s. For example, ["abc", 3] ="abcabcabc".
On the other hand, we define that string s1 can be obtained from string s2 if we can remove some characters from s2 such that it becomes s1. For example, “abc” can be obtained from “abdbec” based on our definition, but it can not be obtained from “acbbe”.
You are given two non-empty strings s1 and s2 (each at most 100 characters long) and two integers 0 ≤ n1 ≤ 106 and 1 ≤ n2 ≤ 106. Now consider the strings S1 and S2, where S1=[s1,n1] and S2=[s2,n2]. Find the maximum integer M such that [S2,M] can be obtained from S1.

## Description
由 n 个连接的字符串 s 组成字符串 S，记作 S = [s,n]。例如，["abc",3]=“abcabcabc”。
如果我们可以从 s2 中删除某些字符使其变为 s1，则称字符串 s1 可以从字符串 s2 获得。例如，根据定义，"abc" 可以从 “abdbec” 获得，但不能从 “acbbe” 获得。
现在给你两个非空字符串 s1 和 s2（每个最多 100 个字符长）和两个整数 0 ≤ n1 ≤ 106 和 1 ≤ n2 ≤ 106。现在考虑字符串 S1 和 S2，其中 S1=[s1,n1] 、S2=[s2,n2] 。
请你找出一个可以满足使[S2,M] 从 S1 获得的最大整数 M 。

## Example
### Example:
    Input:
    s1="acb", n1=4
    s2="ab", n2=2
    
    Return:
    2

## 示例
###   示例：
    输入：
    s1 ="acb",n1 = 4
    s2 ="ab",n2 = 2
    
    返回：
    2

## Other

## 其它


## Solution
### 动态规划
这道题目可以使用动态规划来解决, 不过这里的dp数组的定义需要注意


## Code 

```java
    //T O(m * n)
    //S O(n2)
    public int getMaxRepetitions(String s1, int n1, String s2, int n2) {
        //返回的结果
        int result = 0;

        //特殊处理
        if (n1 == 0 || n2 == 0) {
            return result;
        }


        //获取s1及s2长度
        int s1Length = s1.length();
        int s2Length = s2.length();

        //dp[i][0]表示s2的第i个字符开始与s1的第1个字符比较，记录单次在s1的长度比较下，s2完结比较的次数
        //dp[i][1]表示s2的第i个字符开始与s1的第1个字符比较，记录单次在s1的长度比较下，下一轮开始比较的s2的字符位置
        int[][] dp = new int[s2Length][2];

        int begin, tempResult;

        //计算dp的值
        for (int i = 0; i < s2Length; i++) {
            begin = i;
            tempResult = 0;
            for (int j = 0; j < s1Length; j++) {
                //s2某个字符出现, 向下一位继续比较
                if (s1.charAt(j) == s2.charAt(begin)) {
                    begin++;
                }
                //s2在某个单次的s1中匹配结束
                if (begin == s2Length) {
                    begin = 0;
                    tempResult++;
                }

            }
            dp[i][0] = tempResult;
            dp[i][1] = begin;

        }

        begin = 0;

        //计算在出现n次s1的长度的情况下, s2出现了几次
        for (int i = 0; i < n1; i++) {
            //记录当前字符串中s2到结尾了几次
            result += dp[begin][0];
            //查看下一个s1字串中s2开始的位置
            begin = dp[begin][1];
        }

        //需要查找的是s1重复了n1次的字符串中, 有多少个 s2重复了n2次 的字符串
        result = result / n2;

        return result;


    }
```