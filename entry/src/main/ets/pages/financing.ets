
@Component
struct Financing {
  @State message: string = 'Hello World'
  @State currentIndex: number = 0

  build() {
    Column(){
      Text('融资内容===').fontSize(24).fontWeight(FontWeight.Bold)
    }
  }
}