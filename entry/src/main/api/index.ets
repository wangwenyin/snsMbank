import { HttpManager }  from '../common/https/index';
import { RequestMethod } from '../common/https/RequestOptions';

const getPrdInfo = () => HttpManager.getInstance().request({
    method: RequestMethod.GET,
    url: 'https://easydoc.net/mock/jHMqaINf/snsMbank/product/info'
  }) // 公开的api

export {
  getPrdInfo
}