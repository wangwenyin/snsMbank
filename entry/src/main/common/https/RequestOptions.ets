// 1、创建RequestOption.ets 配置类
/**
 * @desc  : 网络请求配置
 */
export interface RequestOptions {
  url?: string;
  method?: RequestMethod; // default is GET
  queryParams ?: Record<string, string>;
  extraData?: string | Object | ArrayBuffer;
  header?: Object; // default is 'content-type': 'application/json'

}

export enum RequestMethod {
  OPTIONS = "OPTIONS",
  GET = "GET",
  HEAD = "HEAD",
  POST = "POST",
  PUT = "PUT",
  DELETE = "DELETE",
  TRACE = "TRACE",
  CONNECT = "CONNECT"
}