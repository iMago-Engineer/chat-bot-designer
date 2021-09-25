String createPythonScript() {
  return """
from typing import Union
import os, dotenv
from flask import Flask, request, abort
 
from linebot import (
    LineBotApi, WebhookHandler
)
from linebot.exceptions import (
    InvalidSignatureError
)
from linebot.models import (
    MessageEvent, TextMessage, TextSendMessage, TemplateSendMessage
)

# *********************************************
# サーバー設定
# *********************************************

app = Flask(__name__)
 
# 環境変数取得
# LINE Developers: アクセストークン/ChannelSecret
dotenv.load_dotenv()
CHANNEL_ACCESS_TOKEN = os.environ["CHANNEL_ACCESS_TOKEN"]
CHANNEL_SECRET = os.environ["CHANNEL_SECRET"]
 
line_bot_api = LineBotApi(CHANNEL_ACCESS_TOKEN)
handler = WebhookHandler(CHANNEL_SECRET)
 
# 署名検証
@app.route("/callback", methods=['POST'])
def callback():
    # 署名検証のための値
    signature = request.headers['X-Line-Signature']
    body = request.get_data(as_text=True)
    app.logger.info("Request body: " + body)
 
    # 署名検証
    try:
        handler.handle(body, signature)
    except InvalidSignatureError: # 失敗したとき エラー
        print("Invalid signature. Please check your channel access token/channel secret.")
        abort(400)

    return 'OK'

# *********************************************
# ユーザからの入力に対して返信
# *********************************************

@handler.add(MessageEvent, message=TextMessage)
def reply_message_from_reply_block(event):
    # Json からメッセージを取得
    # Json内で "TextSendMessage"や"TemplateSendMessage"を記載
    reply_message = message_from_reply_block(event)
    line_bot_api.reply_message(
        event.reply_token,
        reply_message)

# *********************************************
# ユーザ入力から返信を作成
# *********************************************

def message_from_reply_block(event):
    \"""
    input: LINEBOT event from user
    output: TextSendMessage
    \"""
    # ユーザから送信されたメッセージ
    user_message = event.message.text

    if user_message in MESSAGES_DICT.keys():
        responses = MESSAGES_DICT[user_message]
    else:
        responses = MESSAGES_DICT["None"]

    return [response_as_message_to_send(response) for response in responses]

# 送信するメッセージの型を変更
def response_as_message_to_send(response: dict) -> Union[TextSendMessage, None]:
  response_type = response['type']

  if response_type == 'text':
    return TextSendMessage.new_from_json_dict(response)
  elif response_type == 'template':
    return TemplateSendMessage.new_from_json_dict(response)
  else:
    return None

# *********************************************
# メッセージ辞書
# *********************************************

MESSAGES_DICT = {
  "None": [
    {
      "type": "text",
      "text": "メニューから選択してください。"
    },
  ],
  "かぜ": [
    {
      "type": "text",
      "text": "おちゃけ大好き"
    }
  ],
  "おっくん": [
    {
      "type": "text",
      "text": "おちゃけきらい"
    }
  ]
}


# *********************************************
# サーバー立ち上げ
# *********************************************

if __name__ == "__main__":
    app.run(port=5000)
""";
}
