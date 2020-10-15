# First Bad Version
# 种花问题

## Description
Suppose you have a long flowerbed in which some of the plots are planted and some are not. However, flowers cannot be planted in adjacent plots - they would compete for water and both would die.

Given a flowerbed (represented as an array containing 0 and 1, where 0 means empty and 1 means not empty), and a number n, return if n new flowers can be planted in it without violating the no-adjacent-flowers rule.


## Description
假设你有一个很长的花坛，一部分地块种植了花，另一部分却没有。可是，花卉不能种植在相邻的地块上，它们会争夺水源，两者都会死去。

给定一个花坛（表示为一个数组包含0和1，其中0表示没种植花，1表示种植了花），和一个数 n 。能否在不打破种植规则的情况下种入 n 朵花？能则返回True，不能则返回False。


## Example
### Example 1:
    Input: flowerbed = [1,0,0,0,1], n = 1
    Output: True

### Example 2:
    Input: flowerbed = [1,0,0,0,1], n = 2
    Output: False

## 示例
### 示例 1:
    输入: flowerbed = [1,0,0,0,1], n = 1
    输出: True

### 示例 2:
    输入: flowerbed = [1,0,0,0,1], n = 2
    输出: False

## Solution

### 贪心
我们通过贪心来处理这个问题, 当我们遇到一个左侧和右侧以及本身都是0的情况则将这个位置插入新的花朵.

### Code

```java
    //S O(1)
    public boolean canPlaceFlowers(int[] flowerbed, int n) {
        //定义结果情况,(新增的花朵数量)
        int addCount = 0;

        int i = 0;
        //遍历数组
        while (i < flowerbed.length) {
            //判断是否满足
            //开始和结束的位置只需要判断一侧是否为0
            //其余的位置则需要判断其两端是否都为0
            if (flowerbed[i] == 0
                    && (i == 0 || flowerbed[i - 1] == 0)
                    && (i == flowerbed.length - 1 || flowerbed[i + 1] == 0)) {
                flowerbed[i++] = 1;
                addCount++;
            }

            //判断新增的花朵数量是否满足
            if (addCount >= n) {
                return true;
            }

            i++;
        }

        return false;
    }
```