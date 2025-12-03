import router from '@ohos.router';

@Entry
@Component
struct PomodoroSettingsPage {
  // 定义状态变量来控制 Switch 开关的状态
  @State isRingtoneOn: boolean = true
  @State isVibrationOn: boolean = true
  @State isDisableBreak: boolean = false
  @State isAutoStartBreak: boolean = false
  @State isAutoStartFocus: boolean = false

  // 自定义构建函数：普通的跳转项（如：背景音乐、时长设置）
  @Builder
  CommonItem(title: string, value: string, onClickAction?: () => void) {
    Row() {
      Text(title)
        .fontSize(16)
        .fontColor('#333333')
        .layoutWeight(1)

      Text(value)
        .fontSize(14)
        .fontColor('#999999')
        .margin({ right: 8 })

      Text('>')
        .fontSize(16)
        .fontColor('#CCCCCC')
    }
    .width('100%')
    .height(56)
    .padding({ left: 16, right: 16 })
    .backgroundColor(Color.White)
    .onClick(() => {
      if (onClickAction) onClickAction()
    })
  }

  // 自定义构建函数：开关项（如：震动提醒）
  @Builder
  SwitchItem(title: string, isOn: boolean, onChange: (isOn: boolean) => void) {
    Row() {
      Text(title)
        .fontSize(16)
        .fontColor('#333333')
        .layoutWeight(1)

      Toggle({ type: ToggleType.Switch, isOn: isOn })
        .selectedColor('#E84026') // 设置选中时的红色
        .switchPointColor('#FFFFFF')
        .onChange((isOn: boolean) => {
          onChange(isOn)
        })
    }
    .width('100%')
    .height(56)
    .padding({ left: 16, right: 16 })
    .backgroundColor(Color.White)
  }

  build() {
    Column() {
      // 1. 顶部导航栏 (红色背景)
      Row() {
        Stack({ alignContent: Alignment.Center }) {
          // 返回箭头
          Image($r('app.media.ic_public_arrow_left')) // 注意：需确保你有此资源，或者用 Text('<') 代替
            .width(24)
            .height(24)
            .fillColor(Color.White) // 如果是 SVG 图标可以填色，如果是 Text 则设 fontColor
            .onClick(() => {
              router.back()
            })
          // 如果没有图片资源，暂时用这个 Text 代替：
          /*
          Text('<')
            .fontSize(24)
            .fontColor(Color.White)
            .onClick(() => router.back())
          */
        }
        .padding({ left: 16, right: 16 })

        Text('番茄钟设置')
          .fontSize(20)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Medium)
      }
      .width('100%')
      .height(56)
      .backgroundColor('#FF5E4D') // 番茄红

      // 2. 设置列表内容
      List() {
        // === 第一组：声音与震动 ===
        ListItemGroup() {
          ListItem() {
            this.CommonItem('背景音乐', '海浪')
          }
          ListItem() {
            Divider().color('#F0F0F0').margin({ left: 16 })
          }
          ListItem() {
            this.SwitchItem('铃声提醒', this.isRingtoneOn, (val) => this.isRingtoneOn = val)
          }
          ListItem() {
            Divider().color('#F0F0F0').margin({ left: 16 })
          }
          ListItem() {
            this.SwitchItem('震动提醒', this.isVibrationOn, (val) => this.isVibrationOn = val)
          }
        }
        .backgroundColor(Color.White)
        .margin({ bottom: 12 }) // 组间距

        // === 第二组：时长与自动化 ===
        ListItemGroup() {
          ListItem() {
            this.CommonItem('专注时长', '25分钟')
          }
          ListItem() {
            Divider().color('#F0F0F0').margin({ left: 16 })
          }
          ListItem() {
            this.CommonItem('短时休息', '5分钟')
          }
          ListItem() {
            Divider().color('#F0F0F0').margin({ left: 16 })
          }
          ListItem() {
            this.CommonItem('长时休息', '15分钟')
          }
          ListItem() {
            Divider().color('#F0F0F0').margin({ left: 16 })
          }
          ListItem() {
            this.CommonItem('长时间间隔', '4个番茄')
          }
          ListItem() {
            Divider().color('#F0F0F0').margin({ left: 16 })
          }
          ListItem() {
            this.SwitchItem('禁用休息', this.isDisableBreak, (val) => this.isDisableBreak = val)
          }
          ListItem() {
            Divider().color('#F0F0F0').margin({ left: 16 })
          }
          ListItem() {
            this.SwitchItem('自动开始休息', this.isAutoStartBreak, (val) => this.isAutoStartBreak = val)
          }
          ListItem() {
            Divider().color('#F0F0F0').margin({ left: 16 })
          }
          ListItem() {
            this.SwitchItem('自动开始下次专注', this.isAutoStartFocus, (val) => this.isAutoStartFocus = val)
          }
        }
        .backgroundColor(Color.White)
      }
      .width('100%')
      .height('100%')
      .layoutWeight(1)
      .backgroundColor('#F5F5F5') // 整体背景灰
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
