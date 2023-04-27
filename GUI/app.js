const ws = new WebSocket("ws://dyalog_root/")
const send = data => { ws.send(JSON.stringify(data)) }
function submit() {

}
$ = s => document.querySelector(s)
getKeyPress = e => { $("#prefix_out").innerHTML = e.key + " " + e.code }