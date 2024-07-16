import http from '@ohos.net.http';

class Http {
  httpRequest
  constructor() {
    this.httpRequest = http.createHttp();
  }
  async request(url, method = http.RequestMethod.GET, extraData = {}) {
    // const httpRequest = http.createHttp();
    const response = this.httpRequest.request(
      // 填写HTTP请求的URL地址，可以带参数也可以不带参数。URL地址需要开发者自定义。请求的参数可以在extraData中指定
      url,
      {
        method, // 可选，默认为http.RequestMethod.GET
        extraData,
        // 开发者根据自身业务需要添加header字段
        header: {
          'Content-Type': 'application/json'
        },
        expectDataType: http.HttpDataType.STRING, // 可选，指定返回数据的类型
      }
    );
    // 使用await和async，等待请求完成处理数据后返回
    return new Promise(async (resolve, reject) => {
      await response.then((data) => {
        if (data.responseCode == 200) {
          // 处理返回结果
          const result = data.result + "";
          // console.log(result)
          const res = JSON.parse((result));
          resolve(res);
        } else {
          // todo 请求失败，进行失败逻辑处理
          reject(data)
        }
      });
    }).catch((err) => {
      // todo 请求失败，进行失败逻辑处理
      console.info('error:' + JSON.stringify(err));
    })
  }
}

export default Http;