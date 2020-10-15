# Flip Game II
# 翻转游戏 II

## Description
You are playing the following Flip Game with your friend: Given a string that contains only these two characters: + and -, you and your friend take turns to flip two consecutive "++" into "--". The game ends when a person can no longer make a move and therefore the other person will be the winner.

Write a function to determine if the starting player can guarantee a win.


## Description
你和朋友玩一个叫做「翻转游戏」的游戏，游戏规则：给定一个只有 + 和 - 的字符串。你和朋友轮流将 连续 的两个 "++" 反转成 "--"。 当一方无法进行有效的翻转时便意味着游戏结束，则另一方获胜。

请你写出一个函数来判定起始玩家是否存在必胜的方案。




## Example
### Example1
    Input:  s = "++++"
    Output: true
    Explanation:
    The starting player can guarantee a win by flipping the middle "++" to become "+--+".
### Example2
    Input: s = "+++++"
    Output: false 
    Explanation:
    The starting player can not win 
    "+++--" --> "+----"
    "++--+" --> "----+"


## 示例
    输入: s = "++++"
    输出: true 
    解析: 起始玩家可将中间的 "++" 翻转变为 "+--+" 从而得胜。


## Solution

### 记忆化搜索+SG博弈
这里我们可以通过记忆化搜索的情况来处理重复的可能性, 再结合相关博弈问题的来解决, 同时还可以直接使用SG算法来解决.

### Code

```java
    private Map<String, Boolean> maps = new HashMap<>();

    //T O(2^n)
    //S O(n)
    public boolean canWin(String s) {
        //查看当前状态是否存在
        if (maps.containsKey(s)) {
            return maps.get(s);
        }

        //依次遍历当前可转化的情况
        for (int i = 1; i < s.length(); ++i) {
            //判断当前位置是否可转换
            if (s.charAt(i) == '+' && s.charAt(i - 1) == '+') {
                //获取当前转换后的数组
                String current = s.substring(0, i - 1) + "--" + s.substring(i + 1);
                //递归查看当前情况是否可以保证胜利
                if (!canWin(current)) {
                    //根据情况更新当前的状态及是否需要返回
                    maps.put(current, false);
                    return true;
                }
                maps.put(current, true);
            }
        }
        return false;
    }

    //SG博弈(Sprague-Grundy)
    //T O(n)
    //S O(n)
    public boolean canWin(String s) {
        List<Integer> gList = new ArrayList<>();
        int n = s.length();
        int i = 0, j = 0;
        int max = 0;
        while (i < n) {
            if (s.charAt(i) == '-') i++;
            else {
                for (j = i; j < n && s.charAt(j) == '+'; j++);
                gList.add(j - i);
                if (j - i > max) max = j - i;
                i = j + 1;
            }
        }
        if (max <= 1) return false;
        int[] g = new int[max + 1];
        g[0] = 0; g[1] = 0;
        for (int k = 2; k < max + 1; k++) {
            BitMap bm = new BitMap();
            for (int l = 0; l <= (k - 2) / 2; l++) {
                bm.set(g[l] ^ g[k - 2 - l]);
            }
            for (int l = 0; l < k; l++) {
                if (!bm.contains(l)) { g[k] = l; break; }
            }
        }
        int result = 0;
        while (!gList.isEmpty()) {
            result = result ^ g[gList.get(0)];
            gList.remove(0);
        }
        return result != 0;
    }

    class BitMap {
        char[] M;
        int N;

        BitMap(int n) {
            N = (n + 8) / 8;
            M = new char[N];
        }

        BitMap() {
            N = 1;
            M = new char[N];
        }

        private void expand(int k) {
            if ((k + 8) / 8 < N) return;
            int oldN = N;
            N = (k + 8) / 8 * 2;
            char[] newM = new char[N];
            for (int i = 0; i < oldN; i++) {
                newM[i] = M[i];
            }
            M = newM;
        }

        public boolean contains(int k) {
            expand(k);
            return (M[k >> 3] & (0x80 >> (k & 0x07))) != 0;
        }

        public void set(int k) {
            expand(k);
            M[k >> 3] = (char) (M[k >> 3] | (0x80 >> (k & 0x07)));
        }

        public void delete(int k) {
            expand(k);
            M[k >> 3] = (char) (M[k >> 3] & (~(0x80 >> (k & 0x07))));
        }
    }

```