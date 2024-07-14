@Extend(Text) function fancyText(color: string, size: number, weightValue: number) {
  .fontColor(color)
  .fontSize(size)
  .fontWeight(weightValue)
}

export default {
  fancyText
}