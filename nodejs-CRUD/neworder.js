//引用mysql依赖
const mysql = require("mysql");
//引用express依赖
const express = require("express");
//引用body-parser 解析post传参
const bodyParser = require("body-parser");
//express实例化
const app = express();
//引用 cors
const cors = require("cors");
const { json } = require("body-parser");
//关闭Form表单传值
app.use(bodyParser.urlencoded({ extended: false }));
//使用Json传值
app.use(bodyParser.json());
//使用cors 解决跨域问题
app.use(cors());

const connection = mysql.createConnection({
  host: "localhost",
  user: "root", //是用自己的数据库账号
  password: "", //使用自己的数据库密码
  database: "orderplatform",
});
// 建立数据库连接
connection.connect();

/**
 * insert
 */
app.post("/order/neworder", (req, res) => {
  console.log(req.query);
  console.log(req.body);
  console.log(req.body.shopid);
  let times = 0;
  let f_id = new Date().getTime();
  f_id = parseInt((f_id-f_id%1000)/1000);
  for (times = 0; times < req.body.gids.length; times++) {
    let insertSql = `insert into form VALUES(?,?,?,?,?,?,?,?,?,?)`;
    console.log(insertSql);
    let data = [
      null,
      f_id,
      req.body.username,
      req.body.price[times],
      0,
      req.body.gids[times],
      req.body.nums[times],
      f_id,
      req.body.shopid,
      req.body.tableid,
    ];
    console.log(data);
    connection.query(insertSql, data, function (error, results) {
      if (error) throw error;
      console.log(results);
      // return results;
    });
  }
  return res.json({
    code: 14,
    msg: "",
  });
});

app.listen(3000, () => {
  console.log("running...");
});
