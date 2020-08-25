# Flip Game
# 翻转游戏

## Description
You are playing the following Flip Game with your friend: Given a string that contains only two characters: + and -, you can flip two consecutive "++" into "--", you can only flip one time. Please find all strings that can be obtained after one flip.

Write a program to find all possible states of the string after one valid move.

## Description
你和朋友玩一个叫做「翻转游戏」的游戏，游戏规则：给定一个只有 + 和 - 的字符串。你和朋友轮流将 连续 的两个 "++" 反转成 "--"。 当一方无法进行有效的翻转时便意味着游戏结束，则另一方获胜。

请你写出一个函数，来计算出第一次翻转后，字符串所有的可能状态。



## Example
### Example1
    Input:  s = "++++"
    Output: 
    [
    "--++",
    "+--+",
    "++--"
    ]

### Example2
    Input: s = "---+++-+++-+"
    Output: 
    [
        "---+++-+---+",
        "---+++---+-+",
        "---+---+++-+",
        "-----+-+++-+"
    ]


## 示例
    输入: s = "++++"
    输出: 
    [
    "--++",
    "+--+",
    "++--"
    ]

## 注意
如果不存在可能的有效操作，请返回一个空列表 []。

## Solution

### 迭代
这道题目还是比较简单的, 只要简单的迭代相关信息即可

### Code

```java
    //T O(n)
    //S O(n)
    public List<String> generatePossibleNextMoves(String s) {
        //定义返回的结果集
        List<String> result = new ArrayList<>();

        //特殊情况判断
        if (s == null || s.length() == 0) {
            return result;
        }

        //依次查找当前和下一位是否都为+
        //如果都为+的话则将当前和下一位变为-并保存
        for (int i = 0; i < s.length() - 1; i++) {
            if (s.charAt(i) == '+' && s.charAt(i) == s.charAt(i + 1)) {
                StringBuilder sb = new StringBuilder(s);
                sb.replace(i, i + 2, "--");
                result.add(sb.toString());
            }
        }
        return result;
    }
```