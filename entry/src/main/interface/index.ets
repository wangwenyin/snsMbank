interface Icon {
  icon: ResourceStr,
  text: string,
  url: string
}

interface Product {
  prd: string,
  rate: string,
  maxAmount: string,
  hot?: boolean
}

export {
  Icon,
  Product,
}

