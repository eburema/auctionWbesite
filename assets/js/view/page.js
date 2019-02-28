console.log('Now entering page.js')

import socket from '../socket.js'

let channel = socket.channel("coc:1", {})

let bid = document.getElementById('bid')


channel.on("new_art", payload => {
    document.getElementById('mainimg').src = '/images/' + payload.extern + '.jpg'
    document.getElementById('title').textContent= payload.title
    document.getElementById('artist').textContent= payload.artist
    document.getElementById('description').textContent= payload.description
    bid.textContent = payload.bid

})

channel.on("new_bid", payload =>{bid.textContent = payload.bid})

channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })
