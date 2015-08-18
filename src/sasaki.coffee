# Description
#   A-rin Robot (Sasaki Ayaka commands)
#
# Commands:
#   hubot sasaki - あーりんがかわいい顔で癒してあげるよ。
#   hubot good - あーりんがかわりに褒めてあげるよ
#   hubot どこいく？ - パラダイム！
#   hubot thx - ありがとうをかわりに言います。
#   kakuni - 角煮って言うなー！
#   ピンチ - ピンク？
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   Satoshi Watanabe <sassy.watanabe@gmail.com>

module.exports = (robot) ->
  baseUrl = "https://raw.githubusercontent.com/sassy/hubot-sasaki/master/images/"
  images = [
    "01.jpg"
    "02.jpg"
    "03.jpg"
    "04.jpg"
    "05.jpg"
    "06.jpg"
    "07.jpg"
  ]

  kakunis = [
    "01.jpg"
    "02.jpg"
    "03.jpg"
    "04.jpg"
    "05.jpg"
  ]

  goods = [
    "http://livedoor.blogimg.jp/momoclomatome/imgs/1/3/1314d46e.jpg"
    "http://livedoor.blogimg.jp/momoclomatome/imgs/0/9/0962423e.jpg"
  ]

  robot.respond /sasaki/i, (msg) ->
    img = msg.random images
    msg.send baseUrl + img

  robot.respond /good/i, (msg) ->
    msg.send baseUrl + "good.jpg"

  robot.respond /どこ(い|行)く\?/i, (msg) ->
    msg.send baseUrl + "paradigm.jpg"

  robot.respond /thx/i, (msg) ->
    msg.send baseUrl + "thx.jpg"

  robot.hear /kakuni/i, (msg) ->
    msg.reply "誰が``角煮``や!"
    img = msg.random kakunis
    msg.send baseUrl + "kakuni/" + img

  robot.hear /角煮/i, (msg) ->
    msg.reply "誰が角煮や!"
    img = msg.random kakunis
    msg.send baseUrl + "kakuni/" + img

  robot.hear /ピンチ/i, (msg) ->
    msg.reply baseUrl + "pink.jpg"

  robot.enter (msg) ->
    msg.send "Hello"

  robot.leave (msg) ->
    msg.send "バイバイあーりん!"

  robot.respond /shutdown/i, (msg) ->
    msg.send "バイバイあーりん " + baseUrl + "bye.jpg"
    setTimeout () ->
      process.exit 0
    , 2000
