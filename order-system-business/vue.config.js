const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,
  devServer:{
    proxy:{
      '/localhost':{                     //这个就是的标识，当接口用 localhost 开头才用代理
        target:'http://localhost',       //这是代理到哪里
        pathRewrite:{ '/localhost':''}, //这个是路径重写，比如代理的标识是 localhost，但是要请求的路径里没有 localhost 这个字符串，所以用pathRwrite把  localhost  换成空字符串，也就是删掉，之后再拼到target上就合适了
        changeOrigin:true                //开启代理：在本地会创建一个虚拟服务端，然后发送请求的数据，并同时接收请求的数据，这样服务端和服务端进行数据的交互就不会有跨域问题
      }
    }
  }
})
