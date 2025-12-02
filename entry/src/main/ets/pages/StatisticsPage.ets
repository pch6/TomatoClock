// src/main/ets/pages/StatisticsPage.ets
@Entry
@Component
export struct StatisticsPage {
  build() {
    Column() {
      Text('统计页面')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}