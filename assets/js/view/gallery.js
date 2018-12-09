console.log('Now entering gallery.js')

import socket from '../socket.js'

let channel = socket.channel("coc:1", {})

let clickables = document.querySelectorAll('.clickable')
let regex = /art_/gi

clickables.forEach(clickable => {
  clickable.addEventListener("click", () => {
    channel.push("art_id", {id: clickable.id.replace(regex, '')})
  })
})

channel.on("new_art", payload => {
    let old_element = document.querySelector('.selected')
    let new_element = document.querySelector('#art_' + payload.id)

    old_element.classList.remove('selected')
    new_element.classList.add('selected')
})

channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })
