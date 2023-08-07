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
	showModal(p)
}

function saveScript () {
	fd = new FormData($("#userOptions"))
	opts = objectFromForm(fd)
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

function showModal(el) {
	modal = document.createElement("div")
	modal.classList.add("modal")
	content = document.createElement("div")
	content.classList.add("modal-content")
	content.appendChild(el)
	modal.appendChild(content)
	button = document.createElement("button")
	button.innerHTML = "close"
	button.onclick = function() {modal.style.display = "none"}
	content.appendChild(button)
	document.body.appendChild(modal)
	window.onclick = function(event) {
		if (event.target == modal) { modal.style.display = "none" }
	}
}
