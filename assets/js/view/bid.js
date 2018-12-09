console.log('Now entering page.js')

import socket from '../socket.js'

let channel = socket.channel("coc:1", {})

let bid = document.getElementById('new_bid')
let title = document.getElementById('title')
let current_bid = document.getElementById('current_bid')

bid.addEventListener("keyup", event => {
  if(event.keyCode === 13){
    channel.push("new_bid", {bid: bid.value})
    bid.value = ""
  }
})

channel.on("new_bid", payload =>{current_bid.textContent = payload.bid})
channel.on("new_art", payload =>{
  current_bid.textContent = payload.bid
  title.textContent = payload.title
})

channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })
