// src/main/ets/pages/MinePage.ets
@Entry
@Component
export struct MinePage {
  build() {
    Column() {
      Text('我的页面')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}