import { Index } from './pages/index'

@Entry
@Component
struct App {
  @State message: string = 'Hello World'
  @State currentIndex: number = 0

  @Builder tabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 25, height: 25 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#222' : '#777')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Row() {
      Column() {
        Tabs({ barPosition: BarPosition.End }) {
          TabContent() {
            Scroll() {
              Index()
            }
            .width('100%')
            .height('100%')
          }
          .tabBar(this.tabBuilder('首页', 0, $r('app.media.home_selected'), $r('app.media.home')))
          TabContent() {
            Column(){
              Text('融资内容')
            }
            .width('100%')
            .height('100%')
            .backgroundColor(Color.Red)
          }
          .tabBar(this.tabBuilder('融资', 1, $r('app.media.rz_selected'), $r('app.media.rz')))
          TabContent() {
            Column(){
              Text('工作台内容')
            }
            .width('100%')
            .height('100%')
            .backgroundColor('#1698CE')
          }
          .tabBar(this.tabBuilder('工作台', 2, $r('app.media.gzt_selected'), $r('app.media.gzt')))
          TabContent() {
            Column(){
              Text('投资内容')
            }
            .width('100%')
            .height('100%')
            .backgroundColor('#1698CE')
          }
          .tabBar(this.tabBuilder('投资', 3, $r('app.media.tz_selected'), $r('app.media.tz')))
          TabContent() {
            Column(){
              Text('我的内容')
            }
            .width('100%')
            .height('100%')
            .backgroundColor('#1698CE')
          }
          .tabBar(this.tabBuilder('我的', 2, $r('app.media.my_selected'), $r('app.media.my')))
        }
        .onChange((index: number) => {
          this.currentIndex = index
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}