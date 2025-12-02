// src/main/ets/pages/MainTab.ets
import router from '@ohos.router';
import { Task } from '../model/TaskModel';
import { TasksPage } from './TasksPage';
import { CalendarPage } from './CalendarPage';
import { StatisticsPage } from './StatisticsPage';
import { MinePage } from './MinePage';

@Entry
@Component
struct MainTab {
  private controller: TabsController = new TabsController();
  // 模拟任务数据
  private tasks: Task[] = [
    {
      id: '1',
      title: '任务1',
      completed: false,
      dueDate: '2024-11-03',
      pomodoroCount: 1,
      description: '每次:25分钟 (预计:0/1)'
    },
    {
      id: '2',
      title: '6.太棒了，熟悉使用后点击右上角的菜单键查看更多功能',
      completed: true,
      dueDate: '2024-10-28',
      pomodoroCount: 1,
      description: '完成时间:10月30日 16:16 (逾期完成)'
    },
    {
      id: '3',
      title: '5.点击右侧开始按钮开始番茄钟计时',
      completed: true,
      dueDate: '2024-10-28',
      pomodoroCount: 1,
      description: '完成时间:10月28日 15:00'
    }
  ];

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
        TabContent() {
          TasksPage({ tasks: this.tasks })
        }
        .tabBar('任务')

        TabContent() {
          CalendarPage()
        }
        .tabBar('日历')

        TabContent() {
          StatisticsPage()
        }
        .tabBar('统计')

        TabContent() {
          MinePage()
        }
        .tabBar('我的')
      }
      .width('100%')
      .height('100%')

      // 浮动按钮（右下角 +）
      Button() {
        Text('+')
          .fontSize(24)
          .fontColor(Color.White)
      }
      .onClick(() => {
        router.pushUrl({ url: 'pages/AddTaskPage' });
      })
      .backgroundColor(Color.Red)
      .width(60)
      .height(60)
      .position({ x: 30, y: 30 })
    }
    .width('100%')
    .height('100%')
  }
}