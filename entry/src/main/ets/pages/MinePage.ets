import router from '@ohos.router';

@Entry
@Component
export struct MinePage {

  // 1. 修改 Builder：增加 action 参数，类型为无返回值的函数，可选
  @Builder
  SettingItem(iconColor: Color, iconText: string, title: string, rightText: string = '', action?: () => void) {
    Row() {
      // 左侧图标区域
      Stack({ alignContent: Alignment.Center }) {
        Circle({ width: 30, height: 30 })
          .fill(iconColor)
        Text(iconText)
          .fontSize(14)
          .fontColor(Color.White)
      }
      .margin({ right: 12 })

      // 中间标题
      Text(title)
        .fontSize(16)
        .fontColor('#333333')
        .layoutWeight(1)

      // 右侧文字（如版本号）
      if (rightText) {
        Text(rightText)
          .fontSize(14)
          .fontColor('#999999')
          .margin({ right: 4 })
      }

      // 右侧箭头
      Text('>')
        .fontSize(18)
        .fontColor('#CCCCCC')
    }
    .width('100%')
    .height(56)
    .backgroundColor(Color.White)
    .padding({ left: 16, right: 16 })
    .onClick(() => {
      // 2. 判断是否传入了点击事件，如果有则执行，否则打印日志
      if (action) {
        action();
      } else {
        console.info(`Clicked: ${title}`)
      }
    })
  }

  build() {
    Column() {
      // 顶部标题
      Text('我的')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .padding({ left: 20, top: 20, bottom: 10 })
        .backgroundColor(Color.White)

      List() {
        // 用户登录区域
        ListItem() {
          Row() {
            Stack({ alignContent: Alignment.Center }) {
              Circle({ width: 60, height: 60 })
                .fill('#F0F0F0')
              Text('User')
                .fontSize(12)
                .fontColor('#CCCCCC')
            }
            .margin({ right: 16 })

            Column() {
              Text('点击登录')
                .fontSize(20)
                .fontWeight(FontWeight.Medium)
            }
            .alignItems(HorizontalAlign.Start)
            .layoutWeight(1)

            Text('>')
              .fontSize(18)
              .fontColor('#CCCCCC')
          }
          .width('100%')
          .padding({ top: 30, bottom: 30, left: 16, right: 16 })
          .backgroundColor(Color.White)
          .onClick(() => {
            // 登录跳转逻辑可在此处添加
            // router.pushUrl({ url: 'pages/LoginPage' })
          })
        }

        // 分隔线
        ListItem() {
          Divider().height(10).color('#F5F5F5')
        }

        // 功能列表区
        ListItem() {
          Column() {
            // 3. 在这里配置跳转：传入回调函数
            this.SettingItem(Color.Red, '钟', '番茄钟设置', '', () => {
              router.pushUrl({
                url: 'pages/PomodoroSettingsPage' // 确保文件名一致
              })
            })

            Divider().color('#F5F5F5').margin({ left: 50 })

            this.SettingItem(Color.Orange, '划', '未来计划')
          }
          .backgroundColor(Color.White)
        }

        ListItem() {
          Divider().height(10).color('#F5F5F5')
        }

        // 安全与工具区
        ListItem() {
          Column() {
            this.SettingItem(Color.Blue, '密', '密码保护')
            Divider().color('#F5F5F5').margin({ left: 50 })

            this.SettingItem(Color.Pink, '备', '备份还原')
            Divider().color('#F5F5F5').margin({ left: 50 })

            this.SettingItem(Color.Blue, '桌', '桌面小部件')
          }
          .backgroundColor(Color.White)
        }

        ListItem() {
          Divider().height(10).color('#F5F5F5')
        }

        // 其他信息区
        ListItem() {
          Column() {
            this.SettingItem(Color.Green, '意', '意见反馈')
            Divider().color('#F5F5F5').margin({ left: 50 })

            this.SettingItem(Color.Yellow, '评', '评价应用')
            Divider().color('#F5F5F5').margin({ left: 50 })

            this.SettingItem(Color.Grey, '盾', '隐私政策')
            Divider().color('#F5F5F5').margin({ left: 50 })

            this.SettingItem(Color.Blue, '议', '用户协议')
            Divider().color('#F5F5F5').margin({ left: 50 })

            this.SettingItem(Color.Grey, 'i', '版本检测', '4.1.2')
          }
          .backgroundColor(Color.White)
        }

        // 底部留白
        ListItem() {
          Row().height(20)
        }
      }
      .width('100%')
      .height('100%')
      .layoutWeight(1)
      .backgroundColor('#F5F5F5')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
}
