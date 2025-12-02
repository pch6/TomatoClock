// src/main/ets/pages/CalendarPage.ets
@Entry
@Component
export struct CalendarPage {
  build() {
    Column() {
      Text('日历页面')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}