$ = s => document.querySelector(s)
const ws = new WebSocket("ws://dyalog_root/")
const send = data => { ws.send(JSON.stringify(data)) }

ws.onmessage = function(data) {
	// data: [event number, message]
	result = JSON.parse(data.data)
	eventNumber = result[0]
	let div = document.createElement("div")
	div.innerHTML = result[1]
	switch (eventNumber) {
		case 0:
			showModal(div)
			break;
		case 400:
			div.classList.add("error")
			showModal(div)
			break;
		default:
			showModal(div)
	}
}

function saveScript () {
	fd = new FormData($("#userOptions"))
	// TODO get suspend key option from here, unless we can make it a field form value?
	opts = objectFromForm(fd)
	$("#output").innerHTML = JSON.stringify(opts)
	send(["makeScript", opts])
}

function objectFromForm (formData) {
	// Iterate through form data and place values from elements with names like "key[subKey]" into a nested object structure
	// key[subKey] becomes {key: {subKey: "value"}}
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

function showModal(el) {
	// Display modal window with el as content
	modal = document.createElement("div")
	modal.classList.add("modal")
	const content = document.createElement("div")
	content.classList.add("modal-content")
	content.appendChild(el)
	modal.appendChild(content)
	const button = document.createElement("button")	
	button.innerHTML = "Close"
	button.onclick = function() { modal.style.display = "none" }	
	content.appendChild(button)
	document.body.appendChild(modal)
	window.addEventListener("click", hideModal)
}

function hideModal(event) {
	if (event.target == modal) { modal.style.display = "none" }
}

// TODO
// Control warn about common shortcuts
// Alt warn about menu items
// Left Ctrl and Right Alt ≡ AltGr
// Right Alt on AltGr keyboards means both Alt keys
// Caps Lock option to disable CapsLock behaviour