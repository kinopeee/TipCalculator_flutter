```markdown:spec1.md
# TipCalculator 仕様書

## 概要
TipCalculatorは、ユーザーが請求金額とチップ率を入力することで、チップ金額と合計金額を計算するiOSアプリです。また、為替レートを入力することで、日本円換算額も計算できます。

## 機能一覧
1. **請求金額の入力**
   - ユーザーは請求金額を入力します。
   - 入力は小数点を含む数値で行います。

2. **チップ率の設定**
   - スライダーを使用してチップ率を10%から30%の範囲で設定します。
   - チップ率は1%刻みで調整可能です。

3. **チップ金額の計算**
   - 入力された請求金額と設定されたチップ率に基づいてチップ金額を計算します。

4. **合計金額の計算**
   - 請求金額とチップ金額を合計して、合計金額を表示します。

5. **為替レートの入力**
   - ユーザーは為替レートを入力します。
   - 入力は小数点を含む数値で行います。

6. **日本円換算額の計算**
   - 合計金額と入力された為替レートに基づいて、日本円換算額を計算します。

## UI構成
- **NavigationView**
  - アプリ全体を包むナビゲーションビュー。
  - タイトルは「TipCalculator」。

- **Form**
  - 入力フォームを提供するビュー。

- **Section: チップ計算**
  - **請求金額入力**
    - テキストフィールドで請求金額を入力。
  - **チップ率設定**
    - スライダーでチップ率を設定。
  - **チップ金額表示**
    - 計算されたチップ金額を表示。
  - **合計金額表示**
    - 計算された合計金額を表示。

- **Section: 日本円換算**
  - **為替レート入力**
    - テキストフィールドで為替レートを入力。
  - **円換算額表示**
    - 計算された日本円換算額を表示。

## 関数
- **calculateTip() -> Double**
  - 請求金額とチップ率に基づいてチップ金額を計算します。

- **calculateTotal() -> Double**
  - 請求金額とチップ金額を合計して合計金額を計算します。

- **calculateInYen() -> Double**
  - 合計金額と為替レートに基づいて日本円換算額を計算します。

- **hideKeyboard()**
  - キーボードを非表示にします。

## 使用技術
- **SwiftUI**
  - ユーザーインターフェースの構築に使用。
- **@State**
  - ユーザー入力を管理するための状態変数。
- **NavigationView**
  - ナビゲーションを提供。
- **Form**
  - 入力フォームを提供。

## 開発者情報
- **開発者**: Yuichiro Kinoshita
- **作成日**: 2024/06/05
```