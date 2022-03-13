### 算術演算子 (arithmetic operators)<!--{{{-->

```
+ 整数の加算
- 整数の減算
* 整数の乗算
/ 整数の除算
mod 整数除算の剰余
+. 実数の加算
-. 実数の減算
*. 実数の乗算
/. 実数の除算
```

<!--}}}-->

### 論理演算子 (logical operators)<!--{{{-->

> https://ocaml.jp/refman/ch06s07.html

```
演算子	意味
+	整数の足し算
-	（中置）整数の引き算
-	（前置）整数の符号反転
*	整数の掛け算
/	整数の割り算。第二引数が 0 のときは Division_by_zero 例外が発生する
mod	整数の法。第二引数が 0 のときは Division_by_zero 例外が発生する
land	整数のビットごとの論理積
lor	整数のビットごとの論理和
lxor	整数のビットごとの排他的論理和
lsl	整数のビットごとの左論理シフト
lsr	整数のビットごとの右論理シフト
asr	整数のビットごとの右算術シフト
+.	浮動小数点数の足し算
-.	（中置）浮動小数点数の引き算
-.	（前置）浮動小数点数の符号反転
*.	浮動小数点数の掛け算
/.	浮動小数点数の割り算
**	浮動小数点数の累乗
@	リストの連結
^	文字列の連結
!	参照外し（参照の現在の内容を返す）
:=	参照への代入（第一引数として与えられた参照を第二引数の値で更新する）
=	構造的等価性のテスト
<>	構造的不等性のテスト
==	物理的等価性のテスト
!=	物理的不等性のテスト
<	「小なり」テスト
<=	「小なりイコール」テスト
>	「大なり」テスト
>=	「大なりイコール」テスト
```

<!--}}}-->

### Printf<!--{{{-->

> https://ocaml.org/api/Printf.html

```
% [flags] [width] [.precision] type
d、 i、 n、 l、 L、 N: 引数の整数を符号付き十進数に変換します。
u: 引数の整数を符号なし十進数に変換します。
x: 引数の整数を小文字の符号なし十六進数に変換します。
X: 引数の整数を大文字の符号なし十六進数に変換します。
o: 引数の整数を符号なし八進数に変換します。
s: 引数文字列を挿入します。
S: 引数文字列を Caml 構文で（二重引用符でくくり、エスケープして）挿入します。
c: 引数文字を挿入します。
C: 引数文字を Caml 構文で（単引用符でくくり、エスケープして）挿入します。
f: 浮動小数点数引数を dddd.ddd 形式の十進表記に変換します。
F: 浮動小数点数引数を dddd. か dddd.ddd か d.ddd e+-dd 形式の Caml 構文に変換します。
e、 E: 浮動小数点数引数を d.ddd e+-dd （仮数部と指数部）形式の十進表記に変換します。
g、 G: 浮動小数点数引数を f、 e、 E の形式のうち最も短かくなる形式に変換します。
B: 真偽値の引数を文字列 true か false に変換します。
b: 真偽値の引数を変換します（後方互換性のために残されています。新しいプログラムでは使わないでください）。
!: 引数を取らず、出力をフラッシュします。
%: 引数を取らず、 % を出力します。
,: 変換指定子を区切るためだけに使い、何も出力しません。
```

<!--}}}-->

### 変数 (variable)<!--{{{-->

束縛 (binding)
vairable binding
https://en.wikipedia.org/wiki/Free_variables_and_bound_variables

```ocaml
let varname = expr
```

<!--}}}-->

### データ型 (data type)<!--{{{-->

<https://ocaml.org/learn/tutorials/data_types_and_matching.ja.html>

データ構造:
変異体: ヴァリアント (variant) (修飾つき共用体と列挙型)
レコード: レコード (record) ->

列挙体 (enum)

```ocaml
type a = b | c
type 'a option = None | Some of 'a
```

構造体 (struct)

```c
struct pair_of_ints {
  int a, b;
};
```

to

```ocaml
type pair_of_ints = { a : int; b : int };;
```

共用体 (union)

```
struct foo {
  int type;
#define TYPE_INT 1
#define TYPE_PAIR_OF_INTS 2
#define TYPE_STRING 3
  union {
    int i;        // If type == TYPE_INT.
    int pair[2];  // If type == TYPE_PAIR_OF_INTS.
    char *str;    // If type == TYPE_STRING.
  } u;
};

```

to

```
# type foo =
    | Nothing
    | Int of int
    | Pair of int * int
    | String of string;;

(* |で区切られている。それぞれの区切りの頭のところは、コンストラクタという。 *)
(* 大文字ではじめること。コンストラクタで、値を定義するときは、続けてof typeの部分がくる。 *)
(* typeはいつも小文字ではじまる。上の例では、Nothingは定数として使われ、他のコンストラクタは、値とともに使われている。 *)
```

その他 (example)

```
# type
type t = int;;
type x = X of int;;
type 'a option = None | Some of 'a;;
type 'a pt = Point of 'a * 'a;;
多層バリアント: type 'a pt = [ `point of 'a * 'a ];;
```

<!--}}}-->

### 連結リスト (linked list)<!--{{{-->

> OCaml のリストは、全ての要素が、同じ型

> cons 演算子, パターンマッチングで list を操作するときに便利

以下は全く一緒のものを表す

```ocaml
[1; 2; 3]
1 :: [2; 3]
1 :: 2 :: [3]
1 :: 2 :: 3 :: []
```

<!--}}}-->

### タプル (tuple)<!--{{{-->

```ocaml
let t = (1, 8)
let t2 = (1, (4, 6))
let a, b = t
```

<!--}}}-->

### 再帰定義 (recursion)<!--{{{-->

```ocaml
let rec funcname expr
```

[./lib/factorial.ml](./lib/factorial.ml)
[./lib/fibonacci.ml](./lib/fibonacci.ml)
[./lib/hanoi_tower.ml](./lib/hanoi_tower.ml)

<!--}}}-->

### 相互再帰 (mutual recursion)<!--{{{-->

[相互再帰 - Wikipedia](https://ja.wikipedia.org/wiki/相互再帰)

<!--}}}-->

### 末尾再帰 (tail recursion)<!--{{{-->

[末尾再帰 s - Wikipedia](https://ja.wikipedia.org/wiki/末尾再帰s)

<!--}}}-->

### ジェネリック (generic)<!--{{{-->

[ジェネリックプログラミング - Wikipedia](https://ja.wikipedia.org/wiki/ジェネリックプログラミング)

> ジェネリクスとは、プログラミング言語の機能・仕様の一つで、同じプログラムコードで様々なデータ型のデータを処理できるようにするもの。C++言語などではほぼ同様の機能を「テンプレート」（template）という。
> 目次

<!--}}}-->

### パターンマッチング (pattern matching)<!--{{{-->

```ocaml
let t = [1; 2; 3; 4; 5];;

match t with
    [] -> 0
  | x :: xs -> x;;

match t with
  (x, y) -> x + y;;
```

<!--}}}-->

### 高階関数 (Higher-order function)<!--{{{-->

関数を引数に取る関数

[Higher-order function - Wikipedia](https://en.wikipedia.org/wiki/Higher-order_function)

```ocaml
let twice f x =
  f (f x)

let plus_three =
  (+) 3

let () =
  let g = twice plus_three in

  print_int (g 7); (* 13 *)
  print_newline ()
```

```ocaml
let rec foldr f v lst =
    match lst with
      [] -> v
    | x :: xs -> f x (foldr f v xs);;

foldr (fun x y -> x + y) 0 [1; 2; 3; 4; 5; 6; 7; 8; 9; 10];;

(* 55 *)
```

<!--}}}-->

### 匿名関数 (anonymous function)<!--{{{-->

```ocaml
fun x -> 1 + x;;
let f = fun x y -> x + y;; (* 束縛 *)
```

<!--}}}-->

### カリー化 (currying)<!--{{{-->

```ocaml
fun x -> fun y -> x + y;;
```

```js
const fetch = (method: "POST" | "GET") => {
  return (url: string, param: {}) => {
    // do
  };
};

const post: (url: string, param: {}) => void = fetch("POST");
const get: (url: string, param: {}) => void = fetch("GET");

post("http://fugafugafugafuga", { value: "xxxx" });
get("http://fugafugafugafuga", {});
```

> カリー化 (currying, カリー化された=curried) とは、複数の引数をとる関数を、引数が「もとの関数の最初の引数」で戻り値が「もとの関数の残りの引数を取り結果を返す関数」であるような関数にすること（あるいはその関数のこと）である。

<!--}}}-->

### 部分適用 (partial application)<!--{{{-->

OCaml では、引数を一つだけ与えることが可能となります。

```ocaml
let f x y = x + y
let a = f 1 ;;
Printf.printf "%d" (a 1)
```

<!--}}}-->

### 恒等関数 (identity function)<!--{{{-->

入力した値と同じ値を常にそのまま返す関数です。

```ocaml
let identity x = x;;
```

```py
import numpy as np
import matplotlib.pylab as plt

def koutou(a):
  return a

x = np.arange(-5, 5, 0.1)
y = koutou(x)
plt.plot(x, y)
plt.show()
```

<!--}}}-->

### 多相性<!--{{{-->

```

```

<!--}}}-->
