// src/main/ets/pages/TasksPage.ets
import { Task } from '../model/TaskModel';

@Entry
@Component
export struct TasksPage {
  private tasks: Task[] = [];

  build() {
    Column() {
      // 顶部标题栏
      Row() {
        Text('番茄清单')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .padding(10)
      }
      .backgroundColor(Color.White)
      .height(60)
      .padding({ top: 10, bottom: 10 })

      // 任务列表
      List() {
        ForEach(this.tasks, (task: Task) => {
          ListItem() {
            Column() {
              // 任务项
              Row() {
                Text(task.title)
                  .fontSize(16)
                  .fontWeight(FontWeight.Regular)

                Text(task.dueDate)
                  .fontSize(12)
                  .fontWeight(FontWeight.Bold)
                  .margin({ left: 10 })
              }

              Text(task.description)
                .fontSize(12)
                .fontColor(Color.Gray)
            }
            .padding(10)
          }
        })
      }
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
  }
}