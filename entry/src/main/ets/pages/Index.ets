// import fancyText from '../../commonStyle/extend'
import {
  getPrdInfo
} from '../../api/index'
import {
  Icon,
  Product
} from '../../interface/index'
@Extend(Text) function fancyText(color: string = '#999', size: number = 12, weightValue: number = FontWeight.Normal) {
  .fontColor(color)
  .fontSize(size)
  .fontWeight(weightValue)
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
  @State hotPrd: Product = null
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

  // 定义在组件内的@Styles封装的样式
  @Styles commonLinearGradient() {
    .linearGradient({
      direction: GradientDirection.Bottom,
      colors: [
        [0xFFF8DC, 0.0],
        [0xFFFEFB, 1.0],
      ]
    })
  }

  async aboutToAppear() {
    console.log('进入页面了？')
    const res: any  = await getPrdInfo()
    this.hotPrd = res.find(item => item.hot)
  }
  build() {
    Row() {
      Column() {
        Tabs({ barPosition: BarPosition.End }) {
          TabContent() {
            Scroll() {
              Column(){
                Column() {
                  Flex({
                    justifyContent: FlexAlign.SpaceBetween,
                    alignItems: ItemAlign.Center
                  }) {
                    Search({ placeholder: '输入搜索关键词' })
                      .width('60%')
                      .height(34)
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
                .backgroundImage($r('app.media.bg'))
                .backgroundImageSize(ImageSize.Cover)
                .backgroundImagePosition(Alignment.TopStart)

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


                  Swiper() {
                    Image($r('app.media.banner01')).width('100%').height(104)
                  }
                  .loop(true)
                  .autoPlay(true)
                  .interval(3000)

                  Column(){
                    Text('特色专区').fontSize(20).fontWeight(FontWeight.Bold).fontColor('#222').margin({ top: 20, bottom: 12 })
                    Flex({ justifyContent: FlexAlign.SpaceBetween }){
                      Column(){
                        Flex({ justifyContent: FlexAlign.SpaceBetween }){
                          Text('小微专区').fontSize(16).fontWeight(600).fontColor('#222')
                          Image($r('app.media.more')).width(17)
                        }
                        .margin({ bottom: 5 })
                        Row(){
                          Image($r('app.media.syd')).width(16)
                          Text('速易贷').fontSize(14).margin({ left: 4 })
                        }.margin({ top: 12 })
                        Row(){
                          Image($r('app.media.zzhk')).width(16)
                          Text('转账汇款').fontSize(14).margin({ left: 4 })
                        }.margin({ top: 12 })
                        Row(){
                          Image($r('app.media.yqdz')).width(16)
                          Text('银企对账').fontSize(14).margin({ left: 4 })
                        }.margin({ top: 12 })
                      }
                      .width('49%')
                      .height('100%')
                      .padding(10)
                      .commonLinearGradient()
                      // .backgroundImage($r('app.media.xw_bg'))
                      // .backgroundImageSize({ width: 62 })
                      // .backgroundImagePosition(Alignment.BottomEnd)
                      .alignItems(HorizontalAlign.Start)


                      Column(){
                        Flex({ justifyContent: FlexAlign.SpaceBetween }){
                          Text('票据专区').fontSize(16).fontWeight(600).fontColor('#222')
                          Image($r('app.media.more')).width(17)
                        }
                        .margin({ bottom: 5 })
                        Row(){
                          Image($r('app.media.pjcx')).width(16)
                          Text('持有票据查询').fontSize(14).margin({ left: 4 })
                        }.margin({ top: 12 })
                        Row(){
                          Image($r('app.media.pjcz')).width(16)
                          Text('票据操作记录').fontSize(14).margin({ left: 4 })
                        }.margin({ top: 12 })
                        Row(){
                          Image($r('app.media.pet')).width(16)
                          Text('票e贴').fontSize(14).margin({ left: 4 })
                        }.margin({ top: 12 })
                      }
                      .width('45%')
                      .height('100%')
                      .padding(10)
                      // .backgroundImage($r('app.media.pj_bg'))
                      // .backgroundImagePosition({ x: 100, y: -100 })
                      .commonLinearGradient()
                      .alignItems(HorizontalAlign.Start)
                    }
                    .height(158)
                  }
                  .alignItems(HorizontalAlign.Start)

                  Column(){
                    Row(){
                      Text('企业管家').fontSize(20).fontWeight(FontWeight.Bold).fontColor('#222')
                      Text('助力企业日常经营').fontSize(14).fontColor('#999').margin({ left: 12 })
                    }
                    .margin({ bottom: 15 })
                    Flex({ justifyContent: FlexAlign.SpaceBetween }){
                      Column({ space: 5 }){
                        Image($r('app.media.hkj')).width(26)
                        Text('好会计').fontSize(14).fontColor('#333')
                      }
                      Column({ space: 5 }){
                        Image($r('app.media.dkxx')).width(26)
                        Text('贷款信息').fontSize(14).fontColor('#333')
                      }
                      Column({ space: 5 }){
                        Image($r('app.media.whpj')).width(26)
                        Text('外汇牌价').fontSize(14).fontColor('#333')
                      }
                      Column({ space: 5 }){
                        Image($r('app.media.fpzx')).width(26)
                        Text('发票中心').fontSize(14).fontColor('#333')
                      }
                    }
                  }
                  .alignItems(HorizontalAlign.Start)

                }
                .margin({ top: -25 })
                .padding({ left: 12, right: 12, top: 22, bottom: 22 })
                .borderRadius({ topLeft: 25, topRight: 25 })
                .backgroundColor('#fff')
                .alignItems(HorizontalAlign.Start)

                Column(){
                  Flex({ justifyContent: FlexAlign.SpaceBetween }){
                    Text('优选存款').fontSize(20).fontWeight(FontWeight.Bold).fontColor('#222')
                    Row(){
                      Text('更多').fontColor('#999')
                      Image($r('app.media.more')).width(16)
                    }
                  }
                  .margin({ top: 20, bottom: 12 })
                  Column(){
                    Column({ space: 10 }){
                      Text('整存整取').fontSize(16).fontWeight(600).fontColor('#333')
                      Text('村镇银行存款利率以存款购买交易展示利率为准').fontSize(12).fontColor('#999')
                      Flex({ justifyContent: FlexAlign.SpaceBetween }){
                        Text('3.86%').fancyText('#F23C3C', 24, FontWeight.Bold)
                        Text('3年').fancyText('#333', 18, FontWeight.Bold)
                        Text('1万元起存').fancyText('#333', 18, FontWeight.Bold)
                      }
                      Flex({ justifyContent: FlexAlign.SpaceBetween }){
                        Text('年利率').fancyText()
                        Text('期限').fancyText()
                        Text('起存金额').fancyText()
                      }
                    }
                    .padding({ top: 15, bottom: 15 })
                    .borderWidth({ bottom: 1 })
                    .borderColor({ bottom: '#E7E7E7' })
                    .alignItems(HorizontalAlign.Start)
                    Column({ space: 10 }){
                      Text('定期存款').fontSize(16).fontWeight(600).fontColor('#333')
                      Flex({ justifyContent: FlexAlign.SpaceBetween }){
                        Text('3.86%').fancyText('#F23C3C', 24, FontWeight.Bold)
                        Text('5年').fancyText('#333', 18, FontWeight.Bold)
                        Text('50万元起存').fancyText('#333', 18, FontWeight.Bold)
                      }
                      Flex({ justifyContent: FlexAlign.SpaceBetween }){
                        Text('年利率').fancyText()
                        Text('期限').fancyText()
                        Text('起存金额').fancyText()
                      }
                    }
                    .padding({ top: 15, bottom: 15 })
                    .alignItems(HorizontalAlign.Start)
                  }
                  .padding({ left: 15, right: 15 })
                  .borderRadius(6)
                  .backgroundColor('#fff')
                }
                .padding(12)

                Column({ space: 15 }){
                  Row(){
                    Image($r('app.media.syd2')).width(20)
                    Text(this.hotPrd?.prd).fancyText('#333', 20, 600)
                      .margin({ left: 8, right: 12 })
                    Text('年利率(单利)低至').fancyText('#333', 14)
                    Text(`${ this.hotPrd?.rate }%`).fancyText('#F23C3C', 14)
                      .margin({ left: 3 })
                  }
                  Text(this.hotPrd?.maxAmount).fancyText('#F23C3C', 28, FontWeight.Bold)
                  Text('最高可申请').fancyText('#333', 14)
                  Button('立即申请')
                    .width(80)
                    .height(32)
                    .backgroundColor('#FCC800')
                    .borderRadius(16)
                    .position({ x: 247, y: 74 })
                }
                .width('100%')
                .height(136)
                .margin({ top: 15 })
                .backgroundColor('#fff')
                .padding({ left: 15, right: 15, top: 20, bottom: 20 })
                .alignItems(HorizontalAlign.Start)
              }
              .padding({ bottom: 12 })
              .backgroundColor('#F8F8F8')
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