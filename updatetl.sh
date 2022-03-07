GROUP_ID=<channel_id>
BOT_TOKEN=<bot_token>

curl -s --data "text=$1" --data "chat_id=$GROUP_ID" 'https://api.telegram.org/bot'$BOT_TOKEN'/sendMessage' > /dev/null
