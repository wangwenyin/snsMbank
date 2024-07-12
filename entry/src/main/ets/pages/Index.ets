import image from '@ohos.multimedia.image'

interface Icon {
  icon: ResourceStr,
  text: string,
  url: string
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State currentIndex: number = 0
  @State iconList: Icon[] = [
    { icon: $r('app.media.icon1'), text: '资产视图', url: '' },
    { icon: $r('app.media.icon2'), text: '账户查询', url: '' },
    { icon: $r('app.media.icon3'), text: '贷款计算器', url: '' },
    { icon: $r('app.media.icon4'), text: '存款计算器', url: '' },
    { icon: $r('app.media.icon5'), text: '持有理财', url: '' },
    { icon: $r('app.media.icon6'), text: '企业名片', url: '' },
    { icon: $r('app.media.icon7'), text: '贷款产品', url: '' },
    { icon: $r('app.media.icon8'), text: '电子回单', url: '' },
    { icon: $r('app.media.icon9'), text: '预约取号', url: '' },
    { icon: $r('app.media.icon10'), text: '全部功能', url: '' }
  ]

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

  aboutToAppear(): void {

  }
  build() {
    Row() {
      Column() {
        Tabs({ barPosition: BarPosition.End }) {
          TabContent() {
            Column() {
              Column() {
                Flex({
                  justifyContent: FlexAlign.SpaceBetween,
                  alignItems: ItemAlign.Center
                }) {
                  TextInput({ placeholder: '输入搜索关键词' })
                    .width('60%')
                    .backgroundImage('app.media.search', ImageRepeat.NoRepeat)
                    .backgroundImageSize({
                      width: '18px',
                      height: '18px'
                    })
                    .backgroundColor('#fff')
                    .opacity(.4)
                    .padding({
                      left: 35,
                      right: 35
                    })
                  Image($r('app.media.speak')).width(24).height(24)
                  Image($r('app.media.email')).width(24).height(24)
                  Image($r('app.media.scan')).width(24).height(24)
                }
                .width('100%')
                .height(35)
                .margin({
                  top: 20
                })

                Flex({
                  justifyContent: FlexAlign.SpaceBetween,
                  alignItems: ItemAlign.Center
                }) {
                  Column() {
                    Image($r('app.media.tab1')).width(50).height(50)
                    Text('转账汇款').fontColor('#453800')
                  }

                  Column() {
                    Image($r('app.media.tab2')).width(50).height(50)
                    Text('银企对账').fontColor('#453800')
                  }

                  Column() {
                    Image($r('app.media.tab3')).width(50).height(50)
                    Text('交易明细').fontColor('#453800')
                  }

                  Column() {
                    Image($r('app.media.tab4')).width(50).height(50)
                    Text('审核授权').fontColor('#453800')
                  }
                }
                .margin({
                  top: 30
                })
              }
              .width('100%')
              .height(250)
              .padding(18)
              .backgroundColor('#FCC800')
              .backgroundImage('../../resources/base/media/bg.png')
              .backgroundImageSize(ImageSize.Cover)

              Column() {
                Flex({
                  justifyContent: FlexAlign.SpaceBetween,
                  alignItems: ItemAlign.Center,
                  wrap: FlexWrap.Wrap
                }) {
                  ForEach(this.iconList, (item: Icon) => {
                    Column() {
                      Image(item.icon).width(26).height(26)
                      Text(item.text).fontColor('#453800').fontSize(13)
                    }
                    .width('20%')
                    .margin({
                      bottom: 20
                    })
                  })
                }

                Row(){
                  Image($r('app.media.gg')).width(36).height(17).margin({
                    right: 10
                  })
                  Text('关于调整xx理财产品赎回的通知')
                    .fontColor('#333')
                }
                .width('90%')
                .height(30)
                .padding(5)
                .margin({
                  top: 5,
                  bottom: 25
                })
                .linearGradient({
                  // 0点方向顺时针旋转为正向角度，线性渐变起始角度的默认值为180°
                  colors: [
                    ['#FEE600', 0.0], // 颜色断点1的颜色和比重，对应组件在180°方向上的起始位置
                    ['#FCC800', 1.0], // 颜色断点2的颜色和比重，对应组件在180°方向上的终点位置
                  ]
                })
                .backgroundColor('#FCC800')


                Swiper() {
                  Image($r('app.media.banner01')).width('100%').height(104)
                }
                .loop(true)
                .autoPlay(true)
                .interval(3000)
                .indicator(false)
              }
              .margin({
                top: -25
              })
              .padding({
                left: 12,
                right: 12,
                top: 22,
              })
              .borderRadius({
                topLeft: 25,
                topRight: 25
              })
              .backgroundColor('#fff')
              .alignItems(HorizontalAlign.Start)
            }
            .width('100%')
            .height('100%')
            .backgroundColor('#fff8e0')
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