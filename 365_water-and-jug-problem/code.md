# Water and Jug Problem
# 水壶问题

## Description
You are given two jugs with capacities x and y litres. There is an infinite amount of water supply available. You need to determine whether it is possible to measure exactly z litres using these two jugs.
If z liters of water is measurable, you must have z liters of water contained within one or both buckets by the end.
Operations allowed:
Fill any of the jugs completely with water.
Empty any of the jugs.
Pour water from one jug into another till the other jug is completely full or the first jug itself is empty.

## Description
有两个容量分别为 x升 和 y升 的水壶以及无限多的水。请判断能否通过使用这两个水壶，从而可以得到恰好 z升 的水？
如果可以，最后请用以上水壶中的一或两个来盛放取得的 z升 水。
你允许：
装满任意一个水壶
清空任意一个水壶
从一个水壶向另外一个水壶倒水，直到装满或者倒空

## Example
### Example 1: (From the famous "Die Hard" example)
    Input: x = 3, y = 5, z = 4
    Output: True

### Example 2:
    Input: x = 2, y = 6, z = 5
    Output: False

## 示例
### 示例 1: (From the famous "Die Hard" example)
    输入: x = 3, y = 5, z = 4
    输出: True

### 示例 2:
    输入: x = 2, y = 6, z = 5
    输出: False

## Other
###   Constraints:
* 0 <= x <= 10^6
* 0 <= y <= 10^6
* 0 <= z <= 10^6


## Solution
### 数学法+BFS
这里同样可以归化为树的遍历问题, 我们使用BFS的方法实现对树的遍历, 为了减少重复的统计, 还需要记忆化存储出现的情况.除此之外还可以使用贝祖定理来解决


## Code 

```java
    //T O(xy)
    //S O(xy)
    //BFS
    public boolean canMeasureWater(int x, int y, int z) {

        //特殊情况处理
        if (z > x + y) {
            return false;
        }
        if (x == z || y == z || x + y == z){
            return true;
        }
        // 保存搜索过的情况 避免重复处理
        Set<List<Integer>> set = new HashSet<>();

        // 保存每次操作后，x，y中剩余的水的容量
        Queue<List<Integer>> result = new LinkedList<>();

        //初始化相关信息
        set.add(Arrays.asList(0, 0));
        result.add(Arrays.asList(0, 0));

        while (!result.isEmpty()) {
            //获取并移除首位数组
            List<Integer> poll = result.poll();

            //获取当前两个杯子的水量
            int remain_x = poll.get(0);
            int remain_y = poll.get(1);

            //判断当前两个杯子内水量是否满足
            if (remain_x == z || remain_y == z || remain_x + remain_y == z) {
                return true;
            }

            // 给x加满水
            List<Integer> p1 = Arrays.asList(x, remain_y);
            if (!set.contains(p1)) {
                set.add(p1);
                result.add(p1);
            }

            // 给y加满水
            List<Integer> p2 = Arrays.asList(remain_x, y);
            if (!set.contains(p2)) {
                set.add(p2);
                result.add(p2);
            }


            // 清空x的水
            List<Integer> p3 = Arrays.asList(0, remain_y);
            if (!set.contains(p3)) {
                set.add(p3);
                result.add(p3);
            }

            // 清空y的水
            List<Integer> p4 = Arrays.asList(remain_x, 0);
            if (!set.contains(p4)) {
                set.add(p4);
                result.add(p4);
            }

            // x向y倒水
            int tmp_x = (remain_x + remain_y) <= y ? 0 : remain_x + remain_y - y;
            int tmp_y = (remain_x + remain_y) < y ? remain_x + remain_y : y;
            List<Integer> p5 = Arrays.asList(tmp_x, tmp_y);
            if (!set.contains(p5)) {
                set.add(p5);
                result.add(p5);
            }


            // y向x倒水
            tmp_y = (remain_x + remain_y) <= x ? 0 : remain_x + remain_y - x;
            tmp_x = (remain_x + remain_y) < x ? remain_x + remain_y : x;
            List<Integer> p6 = Arrays.asList(tmp_x, tmp_y);
            if (!set.contains(p6)) {
                set.add(p6);
                result.add(p6);
            }

        }

        return false;
    }

    //T O(log min(x, y))
    //S o(1)
    //数学法
    public boolean canMeasureWater(int x, int y, int z) {
        //特殊情况处理
        if (z > x + y){
            return false;
        }
        if (x == 0 || y == 0){
            return z == 0;
        }
        if (x == z || y == z || x + y == z ){
            return true;
        }
        //判断z能否整除xy的最大公约数
        return z % gcd(x, y) == 0;

    }

    //碾转相除法获取最大公约数
    private int gcd(int m, int n) {
        int temp;
        if (n > m) {
            temp = n;
            n = m;
            m = temp;
        }
        if (m % n == 0) {
            return n;
        }
        return gcd(n, m % n);
    }
```