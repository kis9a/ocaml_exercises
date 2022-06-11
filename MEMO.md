## 演算子

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

### 論理演算子 (logical operators)<!--{{{-->{{{

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

<!--}}}-->}}}

### 演算子一覧<!--{{{-->

[OCaml - The OCaml language](https://ocaml.org/manual/expr.html)

|                 |                                                                     |
| --------------- | ------------------------------------------------------------------- |
| Operator        | Initial meaning                                                     |
| +               | Integer addition.                                                   |
| - (infix)       | Integer subtraction.                                                |
| ~\- - (prefix)  | Integer negation.                                                   |
| \*              | Integer multiplication.                                             |
| /               | Integer division.Raise Division_by_zero if second argument is zero. |
| mod             | Integer modulus. Raise Division_by_zero if second argument is zero. |
| land            | Bitwise logical “and” on integers.                                  |
| lor             | Bitwise logical “or” on integers.                                   |
| lxor            | Bitwise logical “exclusive or” on integers.                         |
| lsl             | Bitwise logical shift left on integers.                             |
| lsr             | Bitwise logical shift right on integers.                            |
| asr             | Bitwise arithmetic shift right on integers.                         |
| +.              | Floating-point addition.                                            |
| -. (infix)      | Floating-point subtraction.                                         |
| ~-. -. (prefix) | Floating-point negation.                                            |
| \*.             | Floating-point multiplication.                                      |
| /.              | Floating-point division.                                            |
| \*\*            | Floating-point exponentiation.                                      |
| @               | List concatenation.                                                 |
| ^               | String concatenation.                                               |
| !               | Dereferencing (return the currentcontents of a reference).          |
| :=              | Reference assignment                                                |
| =               | Structural equality test.                                           |
| <>              | Structural inequality test.                                         |
| ==              | Physical equality test.                                             |
| !=              | Physical inequality test.                                           |
| <               | Test “less than”.                                                   |
| <=              | Test “less than or equal”.                                          |
| >               | Test “greater than”.                                                |
| >=              | Test “greater than or equal”.                                       |
| && &            | Boolean conjunction.                                                |
| \|\| or         | Boolean disjunction.                                                |

<!--}}}-->

## データ型 (data type)

<!--{{{-->

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

### 変数<!--{{{-->

束縛 (binding)
vairable binding
https://en.wikipedia.org/wiki/Free_variables_and_bound_variables

- start at lowcase
- expr equal pratical value in ocaml

```ocaml
let varname = expr

let <variable> <expr1> in <expr2>
```

in expr2 variable scoped in expr2

<!--}}}-->

### 基本型 (basic types)<!--{{{-->

int, float, char, string

<!--}}}-->

### リスト型 (list type)<!--{{{-->

<!--}}}-->

### 配列型 (Array type)<!--{{{-->

- mutable data structure
- index start at 0
- <- modification syntax
- .(i) refer element of array

```
let numbers =[|1;2;3;4|];;
val numbers int array =[|1;2;3;4|];;
numbers.(2)<-43;;
```

<!--}}}-->

### 関数型 (function type)<!--{{{-->

<!--}}}-->

### オプション型 (Option type)<!--{{{-->

多相的なデータ型

```
type 'a option = None | Some of 'a

let rec find_if f = function
  [] -> None
| x :: xs -> if f x then Some x else find_if f xs
```

contractor Some, None

<!--}}}-->

### レコード型 (record type)<!--{{{-->

<!--}}}-->

### バリアント型 (variant type)<!--{{{-->

<!--}}}-->

### 代数データ型 (algebraic types)<!--{{{-->

[「ADT, 直和・直積, State Machine」 - Qiita](https://qiita.com/ymtszw/items/dff02ad6350032688676)

主に直積型と直和型の組み合わせ

### 直和型 (sum type)<!--{{{-->

<!--}}}-->

### 直積型 (product type)<!--{{{-->

まず直積型は、複数の型の、有限個の組み合わせからなる型です。

<!--}}}-->

#### タプル (tuple)<!--{{{-->

```ocaml
let t = (1, 8)
let t2 = (1, (4, 6))
let a, b = t
```

<!--}}}-->

<!--}}}-->

## 標準ライブラリ

### Printf<!--{{{-->

[ OCaml 標準ライブラリ探訪 #3.0: Printf: 便利だけどいろいろ謎のある奴 - camlspotter’s blog](https://camlspotter.hatenablog.com/entry/20091102/1257099984)

[OCaml の format (型安全な printf/scanf) の仕組み - 簡潔な Q](https://qnighy.hatenablog.com/entry/2017/01/26/215948)

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

## その他 (Other)

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

[末尾再帰 - Wikipedia](https://ja.wikipedia.org/wiki/末尾再帰s)

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

In functional programming, Higher-order function (also fold termed reduce, accumulate, aggregate, compress, or inject) refers to a family of higher-order functions that analyze a recursive data structure and through use of a given combining operation, recombine the results of recursively processing its constituent parts, building up a ...

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

### ラベル引数 (lavel arguments)<!--{{{-->

```
let rec label_arg ~first:a ~last:b =
  if a > b then [] else a :: label_arg ~first:(a + 1) ~last:b
```

<!--}}}-->

### オプション引数 (optional arguments)<!--{{{-->

```
let rec optional_arg ?(step = 1) a b =
  if a > b then [] else a :: optional_arg ~step (a + step) b
```

<!--}}}-->

### 一般化された代数的データ型 (GADTs: Generalized algebraic data type)<!--{{{-->

```
type 'a t =
  | Int : int -> int t
  | Bool : bool -> bool t

(* f 型注釈が必須 *)
let f : type a. a t -> int -> bool = fun t y -> match t with
  | Int x -> y >= 2
  | Bool x -> x
;;
```

> 値コンストラクタに依存して、型パラメータの制約が変化しうる
> 型変数が存在量化されうる

[OCaml の GADTs について](https://zenn.dev/0918nobita/scraps/162c21882f0d0b)

<!--}}}-->

### 多相再帰 (polymorphism recursion)<!--{{{-->

```
type 'a fuga =
  | Leaf of 'a
  | Nested of 'a list fuga

(* depth の型注釈が必須 *)
let rec depth: 'a. 'a fuga -> int = function
  | Leaf _ -> 0
  | Nested y -> 1 + depth y
;;

print_int (depth (Nested (Nested (Nested (Leaf [[[0]]])))));;
```

<!--}}}-->

### プリプロセッサー PPX (Preprocessor PPX)<!--{{{-->

[Ocaml PPX](./PPX.md)

##### PreProcessor eXtension framework

None Text processor

Input: AST (Abstract Syntax Tree)
No typing
Output: AST

123456 -> Z.of_string "1234567"

##### How to use

- Macro
- Syntax
  Monadic let
  Typed regex:
  regex "(?P<name>regex)" : <name : string> regex 型情報を持つ正規表現
- Code generator
  type t = Foo [@@deriving show]
- Can't extend OCaml
  AST -> 'aAST

##### Limitation

- Attribute and extension points for things out of the language.
- No type information is available

##### Attribute

- annotation
  expression: [@...]
  toplevel [@@...]
  entire file [@@@...]

Infix or Postfix pattern

- let [@a] .. | let x = .. [@@a]
- match [@a] x with .. | (match x with ..) [@a]

##### Extension points

- extension point
  expression [%a] + 8
  toplevel [%%a]

##### Payload

- payload(each extension, attribute can have a payload)

[@foo 8]
[%var fun x -> M.y ()]
[@pee let x = 1;; let y = 2]
[@foo: int -> int] \s(type signature)
[`bar: [`Foo]]
[%baa? 'a' .. 'z'] \s(pattern)

##### PPX code transformer

.ml
structure -> structure

.mli
signature -> signature ()

tools:
helper, iterator, mapper ...

##### PPX at the buttom

ocaml -ppx ./ppx_my_own.exe code.ml (Hard) Don't do this.
PPX complications, driver, exec speed down, implement io hard ->
Use ppxlib.

##### Example code

```
open Ppxlib
let impl : Ast.structure -> Ast.structure = fun x -> x
let intf : Ast.signature -> Ast.signature = fun x -> x

let () = Ppxlib.Driver.register_transformation
~impl: impl
~intf: intf
"ppx_own"
```

compile with dune

```
; dune(library
(kind ppx_rewriter)
(name ppx_own)
; ( public_name_ppx_own)
(libraries ppxlib))
```

use PPX in in library
link with pps

```
(library
(name my_own)
(public_name my_own)
(preprocess (pps ppx_own ppx_not_own))
(libraries whatever))
```

AST traverse replace int consts by 8

```
class my = object
inherit Ast_traverse.map

method! constrant c =
match c with
| Pconst_integer_ -> Pconst_integer ("8", None)
| _ -> c
end
```

##### Referenced

- https://youtu.be/q--n7KKNPOw

<!--}}}-->

### タグ付き共用体 (tagged union)<!--{{{-->

[タグ付き共用体 | Zen Language Documentation](https://www.zen-lang.org/ja-JP/docs/ch03-tagged-union/)  
[Tagged union - Wikipedia](https://en.wikipedia.org/wiki/Tagged_union)

タグ付き共用体は、列挙型と共用体を組み合わせたデータ構造です。タグ付き共用体により、共用体が有している値のタグを検査してから、そのタグに紐づくヴァリアントを操作することができます。このことにより、複雑なデータ構造を少ないコードで安全に扱うことが可能になります。タグ付き共用体は、関数型言語では代数的データ型と呼ばれるものです。

<!--}}}-->

### Variant type (COM - Component Object Model){{{

[Variant type (COM)](<https://en.wikipedia.org/wiki/Variant_type_(COM)>)

<!--}}}-->

### Dune コンポーザブルビルドシステム (A composable build system)<!--{{{-->

[GitHub - ocaml/dune: A composable build system for OCaml.](https://github.com/ocaml/dune)  
[dune documentation](https://dune.readthedocs.io/en/stable/)

```
dune
(executable
 (name hello_world)
 (libraries lwt.unix))
```

deps: dependence files
action

```
(executable
 (name run_tests)
 (libraries alcotest test_data test_list test_sort test_record))

(rule
 (alias main)
 (deps run_tests.exe)
 (action
  (run %{deps} -q --color=always)))
```

##### Watch

<https://github.com/ocaml/dune/issues/2934>

```
dune build -w @alias_name
```

<!--}}}-->

### ファイル拡張子 (file extensions)<!--{{{-->

- .ml は実装ファイルで定義を書きます。
- .mli はインターフェースファイルで、仕様を書きます。
- .mll は ocamllex というソフトが字句解析プログラムを生成するのに使います。
- .mly は ocamlyacc というソフトが構文解析プログラムを生成するのに使います。
<!--}}}-->

### インタプリタ例 (interpreter example)<!--{{{-->

<https://www.fos.kuis.kyoto-u.ac.jp/~igarashi/class/isle4-06w/text/miniml005.html>

<!--}}}-->

### ファンクタ (fanctor)<!--{{{-->

<!--}}}-->

### モナド

### 物理的平等 (physical equality) · 構造的平等 (structural equality)

> https://str.i.kyushu-u.ac.jp/~bannai/ocaml-intro/traps.html
> 比較演算に == と != を使っていませんか？ OCaml では基本型以外のデータ構造を表す変数は、基本的に はそのデータ構造へのポインタであると理解して良いでしょう。 つまり let a = b などとした場合、 a は b が指しているデータ構造への ポインタの値がそのままコピーされるだけで、そのデータ構造が いかに巨大であろうと一瞬でコピーされます。生成された値が同じでも、当然ポインタとしての値が変わって きてしまいます。 つまりポインタが違う値であっても、中身が同じと言う事が ありえるので、データ構造の中身が同じかどうかを調べたい時に はポインタの値が一緒かどうかを調べるだけでは不十分です。

```
let p1 = "WTF"
let p2 = p1 ;;

Printf.printf "%b\n" (p1 == "WTF") ; (* false *)
Printf.printf "%b\n" (p1 == p2) (* true *)

Printf.printf "%b\n" (p1 = "WTF") ;(* true *)
```
