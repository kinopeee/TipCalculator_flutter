# TipCalculator 仕様書

## 概要
TipCalculatorは、ユーザーが請求金額とチップ率を入力することで、チップ金額と合計金額を計算するiOSアプリです。また、為替レートを入力することで、日本円換算額も計算できます。

## 機能
1. **請求金額の入力**
   - ユーザーは請求金額を入力します。
   - 入力は小数点を含む数値で行います。

2. **チップ率の設定**
   - スライダーを使用してチップ率を10%から30%の範囲で設定します。
   - チップ率は1%刻みで調整可能です。
   - 設定されたチップ率を表示します。

3. **チップ金額の計算**
   - 入力された請求金額と設定されたチップ率に基づいてチップ金額を計算します。

4. **合計金額の計算**
   - 請求金額とチップ金額を合計して、合計金額を表示します。

5. **為替レートの入力**
   - ユーザーは為替レートを入力します。
   - 入力は小数点を含む数値で行います。

6. **日本円換算額の計算**
   - 合計金額と入力された為替レートに基づいて、日本円換算額を計算します。

## 動作
- **請求金額の入力**: テキストフィールドに請求金額を入力します。
- **チップ率の設定**: スライダーでチップ率を設定します。
- **チップ金額の表示**: 計算されたチップ金額が表示されます。
- **合計金額の表示**: 計算された合計金額が表示されます。
- **為替レートの入力**: テキストフィールドに為替レートを入力します。
- **日本円換算額の表示**: 計算された日本円換算額が表示されます。

## 関数
- **calculateTip() -> Double**
  - 請求金額とチップ率に基づいてチップ金額を計算します。
  - ```swift
    func calculateTip() -> Double {
        let amount = Double(totalAmount) ?? 0
        return amount * tipPercentage / 100
    }
    ```

- **calculateTotal() -> Double**
  - 請求金額とチップ金額を合計して合計金額を計算します。
  - ```swift
    func calculateTotal() -> Double {
        let amount = Double(totalAmount) ?? 0
        return amount + calculateTip()
    }
    ```

- **calculateInYen() -> Double**
  - 合計金額と為替レートに基づいて日本円換算額を計算します。
  - ```swift
    func calculateInYen() -> Double {
        let rate = Double(exchangeRate) ?? 0
        return calculateTotal() * rate
    }
    ```

- **hideKeyboard()**
  - キーボードを非表示にします。
  - ```swift
    #if canImport(UIKit)
    extension View {
        func hideKeyboard() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
    #endif
    ```

## 画面デザイン
- **NavigationView**
  - アプリ全体を包むナビゲーションビュー。
  - タイトルは「TipCalculator」。

- **Form**
  - 入力フォームを提供するビュー。

- **Section: チップ計算**
  - **請求金額入力**
    - テキストフィールドで請求金額を入力。
    - フォントサイズ: `.title2`
    - キーボードタイプ: `.decimalPad`
  - **チップ率設定**
    - スライダーでチップ率を設定。
  - **チップ金額表示**
    - 計算されたチップ金額を表示。
    - フォントサイズ: `.title2`
  - **合計金額表示**
    - 計算された合計金額を表示。
    - フォントサイズ: `.title2`

- **Section: 日本円換算**
  - **為替レート入力**
    - テキストフィールドで為替レートを入力。
    - フォントサイズ: `.title2`
    - キーボードタイプ: `.decimalPad`
  - **円換算額表示**
    - 計算された日本円換算額を表示。
    - フォントサイズ: `.title2`

## 操作性
- ユーザーはテキストフィールドに数値を入力し、スライダーでチップ率を調整します。
- 入力フィールドをタップするとキーボードが表示され、画面をタップするとキーボードが非表示になります。

## 設定
- **@State**: ユーザー入力を管理するための状態変数。
  - `@State private var totalAmount: String = ""`
  - `@State private var tipPercentage: Double = 15`
  - `@State private var exchangeRate: String = ""`

- **SwiftUI**: ユーザーインターフェースの構築に使用。
- **NavigationView**: ナビゲーションを提供。
- **Form**: 入力フォームを提供。