$ = s => document.querySelector(s)
const ws = new WebSocket("ws://dyalog_root/")
const send = data => { ws.send(JSON.stringify(data)) }
ws.onmessage = function(data) {
	// data: (error number)(message)
	result = JSON.parse(data.data)
	errorNumber = result[0]
	let p = document.createElement("p")
	p.innerHTML = result[1]
	if ( 0 !== errorNumber ) { p.classList.add("error") }
	$("#output").innerHTML=""
	$("#output").appendChild(p)
}

function saveScript () {
	fd = new FormData($("#userOptions"))
	// TODO get suspend key option from here, unless we can make it a field form value?
	opts = objectFromForm(fd)
	$("#output").innerHTML = JSON.stringify(opts)
	send(opts)
}

function objectFromForm (formData) {
	// Iterate through form data and place values from elements with names like "key[subKey]" into a nested object structure
	r = {}
	fa = [...formData]
	fa.forEach(e=>{
		[fk ,v] = e;   // Form Key, Value
		if ( fk.includes("[") ){
			k = fk.slice(0,fk.indexOf("["))
			sk = fk.slice(fk.indexOf("[")+1,-1)
			if (!r[k]) { r[k] = {} }
			r[k][sk] = v
		} else {
			r[fk] = v
		}
	})
	return r
}

function showModal(html) {
	modal = document.createElement("div")
	modal.classList.add("modal")
	content = document.createElement("div")
	content.classList.add("modal-content")
	content.innerHTML = html
	modal.appendChild(content)
	button = document.createElement("button")
	button.innerHTML = "close"
	button.onclick = function() {modal.style.display = "none"}
	content.appendChild(button)
	document.body.appendChild(modal)
}

window.onclick = function(event) {
	if (event.target == modal) { modal.style.display = "none" }
}
// TODO
// Control warn about common shortcuts
// Alt warn about menu items
// Left Ctrl and Right Alt ≡ AltGr
// Right Alt on AltGr keyboards means both Alt keys
// Caps Lock option to disable CapsLock behaviour