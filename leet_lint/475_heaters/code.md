# Heaters
# 供暖器


## Description
Winter is coming! Your first job during the contest is to design a standard heater with fixed warm radius to warm all the houses.

Now, you are given positions of houses and heaters on a horizontal line, find out minimum radius of heaters so that all houses could be covered by those heaters.

So, your input will be the positions of houses and heaters seperately, and your expected output will be the minimum radius standard of heaters.

## Description
冬季已经来临。 你的任务是设计一个有固定加热半径的供暖器向所有房屋供暖。

现在，给出位于一条水平线上的房屋和供暖器的位置，找到可以覆盖所有房屋的最小加热半径。

所以，你的输入将会是房屋和供暖器的位置。你将输出供暖器的最小加热半径。





## Example
### Example 1:
    Input: [1,2,3],[2]
    Output: 1
    Explanation: The only heater was placed in the position 2, and if we use the radius 1 standard, then all the houses can be warmed.
 
### Example 2:
    Input: [1,2,3,4],[1,4]
    Output: 1
    Explanation: The two heater was placed in the position 1 and 4. We need to use radius 1 standard, then all the houses can be warmed.
 

## 示例
### 示例 1:
    输入: [1,2,3],[2]
    输出: 1
    解释: 仅在位置2上有一个供暖器。如果我们将加热半径设为1，那么所有房屋就都能得到供暖。

### 示例 2:
    输入: [1,2,3,4],[1,4]
    输出: 1
    解释: 在位置1, 4上有两个供暖器。我们需要将加热半径设为1，这样所有房屋就都能得到供暖。

## Note
1. Numbers of houses and heaters you are given are non-negative and will not exceed 25000.
2. Positions of houses and heaters you are given are non-negative and will not exceed 10^9.
3. As long as a house is in the heaters' warm radius range, it can be warmed.
4. All the heaters follow your radius standard and the warm radius will the same.

## 说明
1. 给出的房屋和供暖器的数目是非负数且不会超过 25000。
2. 给出的房屋和供暖器的位置均是非负数且不会超过10^9。
3. 只要房屋位于供暖器的半径内(包括在边缘上)，它就可以得到供暖。
4. 所有供暖器都遵循你的半径标准，加热的半径也一样。



## Solution
### 排序+贪心
这里我们采用先排序来优化数据的结构, 然后采用贪心的方法来找到最近的火炉记录其最大值.

### Code

```java
    //T O(n  * log(max(n, m)))
    //S O(1)
    public int findRadius(int[] houses, int[] heaters) {
        //排序相关数组
        Arrays.sort(houses);
        Arrays.sort(heaters);

        //当前的结果
        int result = 0;
        //当前最后使用的加热器
        int end = 0;

        for (int house : houses) {
            //找到恰好比当前房屋大的加热器
            while (end + 1 < heaters.length && heaters[end] < house) {
                end++;
            }
            //找到当前位置的前后两个加热器距离最近的那个
            if (end == 0) {
                result = Math.max(result,
                        Math.abs(heaters[end] - house)
                );
            } else {
                result = Math.max(result,
                        Math.min(
                                Math.abs(heaters[end] - house),
                                Math.abs(house - heaters[end - 1])
                        )
                );
            }
        }
        return result;
    }
```