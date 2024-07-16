import Http from '../common/https/index2';
import { Product } from '../interface';
const http = new Http()

const getPetData = () => http.request('https://petstore-demo.apifox.com/pet/findByStatus') // 公开的api
const getTodos = () => http.request('https://jsonplaceholder.typicode.com/todos/1') // 公开的api
const getPrdInfo = () => http.request('https://easydoc.net/mock/jHMqaINf/snsMbank/product/info') // 公开的api
export {
  getPetData,
  getTodos,
  getPrdInfo
}