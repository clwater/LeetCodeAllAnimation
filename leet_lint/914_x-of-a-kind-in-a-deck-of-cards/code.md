# X of a Kind in a Deck of Cards
# 卡牌分组

## Description
In a deck of cards, each card has an integer written on it.

Return true if and only if you can choose X >= 2 such that it is possible to split the entire deck into 1 or more groups of cards, where:

Each group has exactly X cards.
All the cards in each group have the same integer.

## Description
给定一副牌，每张牌上都写着一个整数。

此时，你需要选定一个数字 X，使我们可以将整副牌按下述规则分成 1 组或更多组：

每组都有 X 张牌。
组内所有的牌上都写着相同的整数。
仅当你可选的 X >= 2 时返回 true。




## Example
### Example 1:
    Input: deck = [1,2,3,4,4,3,2,1]
    Output: true
    Explanation: Possible partition [1,1],[2,2],[3,3],[4,4].

### Example 2:
    Input: deck = [1,1,1,2,2,2,3,3]
    Output: false´
    Explanation: No possible partition.

### Example 3:
    Input: deck = [1]
    Output: false
    Explanation: No possible partition.

### Example 4:
    Input: deck = [1,1]
    Output: true
    Explanation: Possible partition [1,1].

### Example 5:
    Input: deck = [1,1,2,2,2,2]
    Output: true
    Explanation: Possible partition [1,1],[2,2],[2,2].

## 样例
### 示例 1：
    输入：[1,2,3,4,4,3,2,1]
    输出：true
    解释：可行的分组是 [1,1]，[2,2]，[3,3]，[4,4]

### 示例 2：
    输入：[1,1,1,2,2,2,3,3]
    输出：false
    解释：没有满足要求的分组。

### 示例 3：
    输入：[1]
    输出：false
    解释：没有满足要求的分组。

### 示例 4：
    输入：[1,1]
    输出：true
    解释：可行的分组是 [1,1]

### 示例 5：
    输入：[1,1,2,2,2,2]
    输出：true
    解释：可行的分组是 [1,1]，[2,2]，[2,2]
    提示：
    1 <= deck.length <= 10000
    0 <= deck[i] < 10000

## Constraints:
1. 1 <= deck.length <= 10^4
2. 0 <= deck[i] < 10^4

## 提示：
1. 1 <= deck.length <= 10000
2. 0 <= deck[i] < 10000


## Solution
### 最大公约数
通过我们对题目的解析, 我们可以在这里通过对相应数字出现的次数做最大公约数, 查看其最大公约数是否大于2.



### Code

```java
   
    //T O(n * log(c))
    //S O(n + c)
    public boolean hasGroupsSizeX(int[] deck) {
        //统计当前数组内数字出现的次数
        int[] count = new int[10000];
        for (int c : deck) {
            count[c]++;
        }


        int result = count[0];

        //依次遍历数组查看当前最大公约数情况
        for (int i = 0; i < 10000; ++i) {
            if (count[i] > 0) {
                result = gcd(result, count[i]);

                //如果两个数的最大公约数为1, 则认为不存在可能性
                if (result == 1) {
                    return false;
                }
            }

        }

        return result >= 2;

//         reduce求多个数的最大公约数
//         这里当gcd==1的时候没有提前终止，并且本题数据量太小无法用并行流，因此耗时比for循环慢
//        return Arrays.stream(count).reduce(this::gcd).getAsInt() >= 2;
    }

    //辗转相除法获取两数的最大公约数
    private int gcd(int x, int y) {
        return x == 0 ? y : gcd(y % x, x);
    }
```