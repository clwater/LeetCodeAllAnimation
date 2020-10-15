# Champagne Tower
# 香槟塔


## Description
We stack glasses in a pyramid, where the first row has 1 glass, the second row has 2 glasses, and so on until the 100th row.  Each glass holds one cup (250ml) of champagne.

Then, some champagne is poured in the first glass at the top.  When the top most glass is full, any excess liquid poured will fall equally to the glass immediately to the left and right of it.  When those glasses become full, any excess champagne will fall equally to the left and right of those glasses, and so on.  (A glass at the bottom row has it's excess champagne fall on the floor.)

For example, after one cup of champagne is poured, the top most glass is full.  After two cups of champagne are poured, the two glasses on the second row are half full.  After three cups of champagne are poured, those two cups become full - there are 3 full glasses total now.  After four cups of champagne are poured, the third row has the middle glass half full, and the two outside glasses are a quarter full, Now after pouring some non-negative integer cups of champagne, return how full the j-th glass in the i-th row is (both i and j are 0 indexed.)


## Description
我们把玻璃杯摆成金字塔的形状，其中第一层有1个玻璃杯，第二层有2个，依次类推到第100层，每个玻璃杯(250ml)将盛有香槟。

从顶层的第一个玻璃杯开始倾倒一些香槟，当顶层的杯子满了，任何溢出的香槟都会立刻等流量的流向左右两侧的玻璃杯。当左右两边的杯子也满了，就会等流量的流向它们左右两边的杯子，依次类推。（当最底层的玻璃杯满了，香槟会流到地板上）

例如，在倾倒一杯香槟后，最顶层的玻璃杯满了。倾倒了两杯香槟后，第二层的两个玻璃杯各自盛放一半的香槟。在倒三杯香槟后，第二层的香槟满了 - 此时总共有三个满的玻璃杯。在倒第四杯后，第三层中间的玻璃杯盛放了一半的香槟，他两边的玻璃杯各自盛放了四分之一的香槟，现在当倾倒了非负整数杯香槟后，返回第 i 行 j 个玻璃杯所盛放的香槟占玻璃杯容积的比例（i 和 j都从0开始）。


## Example
### Example 1:
    Input: poured = 1, query_glass = 1, query_row = 1
    Output: 0.0
    Explanation: We poured 1 cup of champange to the top glass of the tower (which is indexed as (0, 0)). There will be no excess liquid so all the glasses under the top glass will remain empty.

### Example 2:
    Input: poured = 2, query_glass = 1, query_row = 1
    Output: 0.5
    Explanation: We poured 2 cups of champange to the top glass of the tower (which is indexed as (0, 0)). There is one cup of excess liquid. The glass indexed as (1, 0) and the glass indexed as (1, 1) will share the excess liquid equally, and each will get half cup of champange.

## 示例
### 示例 1:
    输入: poured(倾倒香槟总杯数) = 1, query_glass(杯子的位置数) = 1, query_row(行数) = 1
    输出: 0.0
    解释: 我们在顶层（下标是（0，0））倒了一杯香槟后，没有溢出，因此所有在顶层以下的玻璃杯都是空的。

### 示例 2:
    输入: poured(倾倒香槟总杯数) = 2, query_glass(杯子的位置数) = 1, query_row(行数) = 1
    输出: 0.5
    解释: 我们在顶层（下标是（0，0）倒了两杯香槟后，有一杯量的香槟将从顶层溢出，位于（1，0）的玻璃杯和（1，1）的玻璃杯平分了这一杯香槟，所以每个玻璃杯有一半的香槟。


## Note:
* poured will be in the range of [0, 10 ^ 9].
* query_glass and query_row will be in the range of [0, 99].

## 提示
* poured 的范围[0, 10 ^ 9]。
* query_glass 和query_row 的范围 [0, 99]。


## Solution
### 迭代模拟
这个题目我们只能使用迭代模拟的方法来解答,  我们通过一个二维的数组来记录每一层每个杯子的情况, 模拟导入对应香槟的情况.

### Code

```java
    //T O(n^2)
    //S O(n^2)
    public double champagneTower(int poured, int query_row, int query_glass) {
        //定义模拟数组
        double[][] result = new double[101][101];
        //第一个倒入所有的容量总数
        result[0][0] = poured;

        //依次循环模拟到需要的层数
        for (int r = 0; r <= query_row; ++r) {
            for (int c = 0; c <= r; ++c) {
                //获取当前向下一层每个杯子经过的流量
                double over = (result[r][c] - 1.0) / 2.0;
                if (over > 0) {
                    //分别流入其左侧和右侧的杯子中
                    result[r + 1][c] += over;
                    result[r + 1][c + 1] += over;
                }
            }
        }

        //被子内最大流量为1
        return Math.min(1, result[query_row][query_glass]);
    }
```