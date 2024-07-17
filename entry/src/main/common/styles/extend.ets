@Extend(Text) function fancyText(color: string = '#999', size: number = 12, weightValue: number = FontWeight.Normal) {
  .fontColor(color)
  .fontSize(size)
  .fontWeight(weightValue)
}

export {
  fancyText
}