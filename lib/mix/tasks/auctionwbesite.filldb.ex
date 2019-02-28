defmodule Mix.Tasks.AuctionWbesite.FillDb do
  use Mix.Task
  alias AuctionWbesite.Repo, as: Repo
  alias AuctionWbesite.Artist, as: Artist
  alias AuctionWbesite.Art, as: Art
  alias AuctionWbesite.Agent, as: Store
  alias Ecto.Changeset, as: Changeset

  
  
  def run(_args) do
    Mix.Task.run("app.start")
    Mix.shell.info("Starting!")
    
    Enum.each value_to_insert, fn item ->
        item2 = if(String.length(item.description) > 255) do
            %{item | description: String.slice(item.description, 0..251) <> "..." }
        else
            item
        end
        
        artist_temp = Repo.get_by(Artist, name: item2.artist.name)
        
        
        artist = if (artist_temp === nil) do
            artist = Artist.changeset(%Artist{}, item2.artist)
            Repo.insert_or_update artist
            Repo.get_by(Artist, name: item2.artist.name)
        else
            artist_temp
        end
            
        
        artist 
        |> Ecto.build_assoc(:arts)
        |> Art.changeset(item2)
        |> Repo.insert_or_update
    end
    
  end
  
  def value_to_insert do
  [
%{extern_id: "846" ,title: "Exclusive Limited Edition Hømf! Bucket" ,artist: %{name: "Miles T.F. Baxxter" } ,description: "Great for putting things in! Water, snow, puppies, your dignity, other smaller buckets – the sky's the limit! Don't miss out!" ,current_bid: 10 },
%{extern_id: "847" ,title: "Paper table cover with drawings" ,artist: %{name: "Various NordicFuzzCon attendees" } ,description: "This is either from NordicFuzzCon 2013 or 2014. Various public tables were covered in paper, on which attendees would draw, write, and spill their drinks. A real part of NordicFuzzCon history!" ,current_bid: 100 },
%{extern_id: "715" ,title: "NFC Photo Competition, Winner \"Fursuits in the Snow\"" ,artist: %{name: "[placeholder, winner category 1]" } ,description: "The winner of the 2019 NordicFuzzCon Photo Competition in the category \"Fursuits in the Snow\"" ,current_bid: 10 },
%{extern_id: "716" ,title: "NFC Photo Competition, Winner \"Winter Holiday Season\"" ,artist: %{name: "[placeholder, winner category 2]" } ,description: "The winner of the 2019 NordicFuzzCon Photo Competition in the category \"Winter Holiday Season\"" ,current_bid: 10 },
%{extern_id: "710" ,title: "Snacks" ,artist: %{name: "gatorguts" } ,description: "" ,current_bid: 250 },
%{extern_id: "848" ,title: "Into the woods" ,artist: %{name: "Davuu" } ,description: "" ,current_bid: 50 },
%{extern_id: "838" ,title: "Sea Dreams" ,artist: %{name: "Davuu" } ,description: "Follow your dreams into a sea of mystery and imagination." ,current_bid: 50 },
%{extern_id: "839" ,title: "Husky Joy" ,artist: %{name: "Davuu" } ,description: "Boundless bundles of husky joy expressed in a colour of bright rainbows" ,current_bid: 50 },
%{extern_id: "840" ,title: "Tiger Tiger" ,artist: %{name: "Davuu" } ,description: "Burning bright with all the gold of the night" ,current_bid: 50 },
%{extern_id: "841" ,title: "Ocelot" ,artist: %{name: "Davuu" } ,description: "A little shining light amongst the shadows" ,current_bid: 50 },
%{extern_id: "842" ,title: "Pine Marten Cushion cover" ,artist: %{name: "Davuu" } ,description: "Made from snuggly fleece with a soft cotton backing this Pine Marten will keep you company whenever you need something snuggly." ,current_bid: 100 },
%{extern_id: "843" ,title: "Pine Marten polychromos" ,artist: %{name: "Davuu" } ,description: "A playful pine Marten guarding his egg done in polychromos" ,current_bid: 50 },
%{extern_id: "844" ,title: "Little dragon" ,artist: %{name: "Davuu" } ,description: "Practising his fiercest look for when he’s A fully fledged dragon" ,current_bid: 50 },
%{extern_id: "845" ,title: "Little bunny hops" ,artist: %{name: "Davuu" } ,description: "Hop hop hop into your life with its little bunny hops and big take me home eyes" ,current_bid: 50 },
%{extern_id: "708" ,title: "Tiger flirt" ,artist: %{name: "Haxzure" } ,description: "Aquarelle painting of a flirting tiger male hiding his parts with his tail." ,current_bid: 250 },
%{extern_id: "728" ,title: "Kitten in snow" ,artist: %{name: "Haxzure / Toni" } ,description: "Depicts a kitten dressed in a wintery \"christmas\" themed dress, standing next to a snowball lantern.\n\n(Not as yellow irl as in picture)" ,current_bid: 80 },
%{extern_id: "729" ,title: "Jungle Jay" ,artist: %{name: "Haxzure / Toni" } ,description: "Bird similar to a blue jay in a jungle scenario with shimmering red leaves in the background. The bird is sitting on a branch.\n\n(Not as messy irl as in picture)" ,current_bid: 120 },
%{extern_id: "730" ,title: "Goat discipline" ,artist: %{name: "Haxzure / Toni" } ,description: "NSFW\nChubby grey male goat bound in red bondage rope. \nPosing for a picture taken by mysterious other fur holding a smartphone. \nPiercings and bell filled in with gold/silver pens." ,current_bid: 200 },
%{extern_id: "777" ,title: "Dum spiro, spero" ,artist: %{name: "Crowfangs" } ,description: "\"As long as I breathe, I hope\" - latin proverb" ,current_bid: 1000 },
%{extern_id: "751" ,title: "Deck the halls with socks and possums" ,artist: %{name: "PuddiPortraits" } ,description: "A small, cute illustration of a possum doing one of the things possums do best, hanging about!\nPerfectly within this year's con theme and as Christmas decoration." ,current_bid: 100 },
%{extern_id: "752" ,title: "First-Aid Fox" ,artist: %{name: "PuddiPortraits" } ,description: "Got hurt during the convention? No fuzz! First-Aid Fox has got you covered and up on your paws in no time!" ,current_bid: 150 },
%{extern_id: "753" ,title: "Pandamonium" ,artist: %{name: "PuddiPortraits" } ,description: "It's pandamonium! These rainbow colored panda's are up to a lot of mischief. Will you give them a forever home?" ,current_bid: 200 },
%{extern_id: "717" ,title: "Orange Portal Collar" ,artist: %{name: "Kauri Kakarauri" } ,description: "Handmade collar themed after the portal games, orange version.\n3cm wide strap, aluminum buckle, stainless steel ring and ladder.\n\nIntended adjustability for 39-41cm neck circumference." ,current_bid: 250 },
%{extern_id: "718" ,title: "Blue Portal Collar" ,artist: %{name: "Kauri Kakarauri" } ,description: "Handmade collar themed after the portal games, blue version.\n3cm wide strap, aluminum buckle, stainless steel ring and ladder.\n\nIntended adjustability for 37.5-39.5cm neck circumference." ,current_bid: 250 },
%{extern_id: "857" ,title: "baa" ,artist: %{name: "muura" } ,description: "" ,current_bid: 310 },
%{extern_id: "736" ,title: "Snow Leopard head" ,artist: %{name: "Dire Creatures" } ,description: "Brand new head of snow leopard in our semirealistic style.\nHead:\nResin base, resin handpainted jawset, silicone tongue, glass follow-me eyes, moving jaw, hidden zipper in the back.\n\nP.S. if the price reach 12k SEK, we upgrade it to starter suit (tail + handpaws)" ,current_bid: 4000 },
%{extern_id: "737" ,title: "Tiger head" ,artist: %{name: "Dire Creatures" } ,description: "Brand new head of tiger in our semirealistic style. Head: Resin base, resin handpainted jawset, silicone tongue, glass follow-me eyes, moving jaw, hidden zipper in the back. P.S. if the price reach 12k SEK, we upgrade it to starter suit (tail + handpaws)" ,current_bid: 4000 },
%{extern_id: "754" ,title: "Taste of Tranquility" ,artist: %{name: "Dey Varah, Johis" } ,description: "A collaboration between Johis and Dey Varah, to celebrate the magical feeling of a quiet, snowy forest." ,current_bid: 350 },
%{extern_id: "746" ,title: "Celestial" ,artist: %{name: "Karbik" } ,description: "" ,current_bid: 400 },
%{extern_id: "849" ,title: "Trail" ,artist: %{name: "Karbik" } ,description: "Use this winter howliday to go out and practice your tracker skills! Who is this creature that has been through here...?" ,current_bid: 400 },
%{extern_id: "850" ,title: "Your Queen" ,artist: %{name: "Karbik" } ,description: "Your queen demands attention" ,current_bid: 400 },
%{extern_id: "750" ,title: "Manta" ,artist: %{name: "Karbik" } ,description: "" ,current_bid: 400 },
%{extern_id: "831" ,title: "Large grey fox tail" ,artist: %{name: "Livingbeasts" } ,description: "A large grey fursuit fox tail." ,current_bid: 500 },
%{extern_id: "853" ,title: "Fox on ice" ,artist: %{name: "MercilessBlackWolf" } ,description: "" ,current_bid: 100 },
%{extern_id: "854" ,title: "Fox in a box" ,artist: %{name: "MercilessBlackWolf" } ,description: "" ,current_bid: 100 },
%{extern_id: "858" ,title: "Furry Metal" ,artist: %{name: "MercilessBlackWolf" } ,description: "" ,current_bid: 100 },
%{extern_id: "832" ,title: "light melodies" ,artist: %{name: "Koul" } ,description: "-" ,current_bid: 10 },
%{extern_id: "833" ,title: "red signal" ,artist: %{name: "Koul" } ,description: "-" ,current_bid: 10 },
%{extern_id: "834" ,title: "Husky power" ,artist: %{name: "Koul" } ,description: "-" ,current_bid: 10 },
%{extern_id: "835" ,title: "The Shaman" ,artist: %{name: "Koul" } ,description: "-" ,current_bid: 10 },
%{extern_id: "836" ,title: "Space fox" ,artist: %{name: "Koul" } ,description: "-" ,current_bid: 10 },
%{extern_id: "837" ,title: "Fire Ring" ,artist: %{name: "Koul" } ,description: "-" ,current_bid: 10 },
%{extern_id: "824" ,title: "hard winter time" ,artist: %{name: "Koul" } ,description: "poor fluffy fox" ,current_bid: 10 },
%{extern_id: "825" ,title: "The city evening" ,artist: %{name: "Koul" } ,description: "-" ,current_bid: 10 },
%{extern_id: "826" ,title: "Feeling" ,artist: %{name: "Koul" } ,description: "-" ,current_bid: 10 },
%{extern_id: "827" ,title: "Rock girl" ,artist: %{name: "Koul" } ,description: "-" ,current_bid: 10 },
%{extern_id: "828" ,title: "Irbis Spirit" ,artist: %{name: "Koul" } ,description: "-" ,current_bid: 10 },
%{extern_id: "829" ,title: "Woof Spirit" ,artist: %{name: "Koul" } ,description: "-" ,current_bid: 10 },
%{extern_id: "830" ,title: "Shy boy" ,artist: %{name: "Koul" } ,description: "-" ,current_bid: 10 },
%{extern_id: "758" ,title: "AWD" ,artist: %{name: "Koul" } ,description: "Limited print 2\3 (second one)" ,current_bid: 10 },
%{extern_id: "756" ,title: "Johny in kigurumi" ,artist: %{name: "Koul" } ,description: "Limited print 2\3 (second one)" ,current_bid: 10 },
%{extern_id: "814" ,title: "Roxy" ,artist: %{name: "Koul" } ,description: "Limited print 2\2 (last one)" ,current_bid: 10 },
%{extern_id: "816" ,title: "Johny Upside Down" ,artist: %{name: "Koul" } ,description: "Limited print 2\3 (second one)" ,current_bid: 10 },
%{extern_id: "818" ,title: "Computer Guy" ,artist: %{name: "ANGO76" } ,description: "" ,current_bid: 10 },
%{extern_id: "819" ,title: "Think About It" ,artist: %{name: "ANGO76" } ,description: "" ,current_bid: 10 },
%{extern_id: "820" ,title: "Moscow City" ,artist: %{name: "ANGO76" } ,description: "" ,current_bid: 10 },
%{extern_id: "821" ,title: "Home Work" ,artist: %{name: "ANGO76" } ,description: "" ,current_bid: 10 },
%{extern_id: "822" ,title: "On The Balcony" ,artist: %{name: "ANGO76" } ,description: "" ,current_bid: 10 },
%{extern_id: "770" ,title: "Sea Boy" ,artist: %{name: "ANGO76" } ,description: "" ,current_bid: 10 },
%{extern_id: "771" ,title: "Rock Star" ,artist: %{name: "ANGO76" } ,description: "" ,current_bid: 10 },
%{extern_id: "772" ,title: "Motorbike" ,artist: %{name: "ANGO76" } ,description: "" ,current_bid: 10 },
%{extern_id: "773" ,title: "Let's Go, Buddy" ,artist: %{name: "ANGO76" } ,description: "" ,current_bid: 10 },
%{extern_id: "774" ,title: "Doggie" ,artist: %{name: "ANGO76" } ,description: "" ,current_bid: 10 },
%{extern_id: "876" ,title: "The Desert" ,artist: %{name: "ANGO76" } ,description: "" ,current_bid: 10 },
%{extern_id: "757" ,title: "Pretty foxy" ,artist: %{name: "Imanika" } ,description: "Original art with random character" ,current_bid: 650 },
%{extern_id: "759" ,title: "Swimming" ,artist: %{name: "Imanika" } ,description: "Original art with random character" ,current_bid: 650 },
%{extern_id: "760" ,title: "Volleyball play" ,artist: %{name: "Imanika" } ,description: "Original art with random character" ,current_bid: 650 },
%{extern_id: "761" ,title: "Fox with fishes" ,artist: %{name: "Imanika" } ,description: "Original art with random character" ,current_bid: 600 },
%{extern_id: "762" ,title: "Lion relaxing" ,artist: %{name: "Imanika" } ,description: "Original art with random character" ,current_bid: 500 },
%{extern_id: "763" ,title: "Happy doggie" ,artist: %{name: "Imanika" } ,description: "Original art with random character" ,current_bid: 500 },
%{extern_id: "764" ,title: "Irbis girl" ,artist: %{name: "Imanika" } ,description: "Original art with random character" ,current_bid: 500 },
%{extern_id: "765" ,title: "Mountain shower" ,artist: %{name: "Imanika" } ,description: "Limited print" ,current_bid: 500 },
%{extern_id: "766" ,title: "Fox with a butterfly" ,artist: %{name: "Imanika" } ,description: "Limited print" ,current_bid: 500 },
%{extern_id: "767" ,title: "Molly" ,artist: %{name: "Orphen-Sirius" } ,description: "Digital art" ,current_bid: 450 },
%{extern_id: "768" ,title: "juice for bat" ,artist: %{name: "Orphen-Sirius" } ,description: "Digital art" ,current_bid: 200 },
%{extern_id: "769" ,title: "Salvator" ,artist: %{name: "Orphen-Sirius" } ,description: "Digital art" ,current_bid: 450 },
%{extern_id: "713" ,title: "Coat" ,artist: %{name: "Wildering" } ,description: "Limited print from Wildering" ,current_bid: 800 },
%{extern_id: "714" ,title: "Avery" ,artist: %{name: "Wildering" } ,description: "Limited print" ,current_bid: 950 },
%{extern_id: "755" ,title: "Music sunset" ,artist: %{name: "Imanika" } ,description: "Original art with random character" ,current_bid: 500 },
%{extern_id: "703" ,title: "Night sky" ,artist: %{name: "Lyrra" } ,description: "" ,current_bid: 800 },
%{extern_id: "704" ,title: "Bear in a boat" ,artist: %{name: "Lyrra" } ,description: "" ,current_bid: 10 },
%{extern_id: "875" ,title: "Hand paw printed bag" ,artist: %{name: "Lyrra" } ,description: "An organic cotton tote bag with hand printed paw prints" ,current_bid: 100 },
%{extern_id: "719" ,title: "Reflection" ,artist: %{name: "Snowyzi" } ,description: "" ,current_bid: 200 },
%{extern_id: "859" ,title: "Reindeer in the snow" ,artist: %{name: "Dracky" } ,description: "" ,current_bid: 300 },
%{extern_id: "860" ,title: "Happy pup!" ,artist: %{name: "Dracky" } ,description: "" ,current_bid: 300 },
%{extern_id: "861" ,title: "Black and Gold" ,artist: %{name: "Dracky" } ,description: "" ,current_bid: 200 },
%{extern_id: "862" ,title: "Gold and Black" ,artist: %{name: "Dracky" } ,description: "" ,current_bid: 200 },
%{extern_id: "863" ,title: "A Familiar Fox" ,artist: %{name: "Dracky" } ,description: "Made in 2017" ,current_bid: 200 },
%{extern_id: "864" ,title: "Sled dog" ,artist: %{name: "Dracky" } ,description: "Made in 2017" ,current_bid: 200 },
%{extern_id: "865" ,title: "Gotta Catch 'Em All" ,artist: %{name: "Dracky" } ,description: "Made for the NFC 2019 trading card!" ,current_bid: 200 },
%{extern_id: "851" ,title: "Huff." ,artist: %{name: "Dracky" } ,description: "" ,current_bid: 300 },
%{extern_id: "705" ,title: "Bunny spirit" ,artist: %{name: "Scale" } ,description: "When that wolf said he was going to steal her heart she didn’t think he meant it so literally…" ,current_bid: 1500 },
%{extern_id: "706" ,title: "Powerless" ,artist: %{name: "Scale" } ,description: "Minotaurs are traditionally symbols of human disgrace and turmoil, and in the world of modern furry imagination, full as it is of highly sexual creatures, what disgrace could be worse than impotence?" ,current_bid: 1500 },
%{extern_id: "707" ,title: "Mademouselle" ,artist: %{name: "Scale" } ,description: "" ,current_bid: 700 },
%{extern_id: "712" ,title: "Laying lion" ,artist: %{name: "Scale" } ,description: "" ,current_bid: 1500 },
%{extern_id: "775" ,title: "Posca Wolf" ,artist: %{name: "Kikonine" } ,description: "" ,current_bid: 200 },
%{extern_id: "874" ,title: "Wolf Café" ,artist: %{name: "Kikonine" } ,description: "" ,current_bid: 200 },
%{extern_id: "873" ,title: "Sleeping Fox" ,artist: %{name: "NargilFlameWolf" } ,description: "" ,current_bid: 10 },
%{extern_id: "776" ,title: "Frosty Stars" ,artist: %{name: "NargilFlameWolf" } ,description: "" ,current_bid: 50 },
%{extern_id: "856" ,title: "Sleeping wolfcub" ,artist: %{name: "NargilFlameWolf" } ,description: "" ,current_bid: 10 },
%{extern_id: "709" ,title: "Hold on to the air with ice" ,artist: %{name: "NargilFlameWolf" } ,description: "Exclusive upgraded version for print" ,current_bid: 10 },
%{extern_id: "778" ,title: "Falling" ,artist: %{name: "NargilFlameWolf" } ,description: "Exclusive upgraded version for print" ,current_bid: 10 },
%{extern_id: "779" ,title: "Werewolf" ,artist: %{name: "NargilFlameWolf" } ,description: "Exclusive upgraded version for print" ,current_bid: 10 },
%{extern_id: "781" ,title: "Alchemist" ,artist: %{name: "NargilFlameWolf" } ,description: "" ,current_bid: 10 },
%{extern_id: "782" ,title: "Dance with me" ,artist: %{name: "NargilFlameWolf" } ,description: "Exclusive redrawed version for print" ,current_bid: 50 },
%{extern_id: "783" ,title: "SOULSHAMANFOX" ,artist: %{name: "NargilFlameWolf" } ,description: "Actual artist: PlamyaFox, \nthe art and description belongs to PlamyaFox\nArtist gallery: https://www.furaffinity.net/user/plamyafox\nAmulet to the soul of the fox forest keeper" ,current_bid: 100 },
%{extern_id: "784" ,title: "SOULSHAMANWOLF" ,artist: %{name: "NargilFlameWolf" } ,description: "Actual artist: PlamyaFox, \nthe art and description belongs to PlamyaFox\nArtist gallery: https://www.furaffinity.net/user/plamyafox\nAmulet to the soul of the wolf forest keeper" ,current_bid: 100 },
%{extern_id: "785" ,title: "Amulet for two \"Wolf Trail\"" ,artist: %{name: "NarilFlameWolf" } ,description: "Actual artist: PlamyaFox, \nthe art and description belongs to PlamyaFox\nArtist gallery: https://www.furaffinity.net/user/plamyafox\nThe decoration is intended for people who love each other." ,current_bid: 50 },
%{extern_id: "786" ,title: "Smart Fox" ,artist: %{name: "NargilFlameWolf" } ,description: "Actual artist: PlamyaFox, \nthe art and description belongs to PlamyaFox\nArtist gallery: https://www.furaffinity.net/user/plamyafox\nDecoration in the form of a sly fox" ,current_bid: 50 },
%{extern_id: "787" ,title: "Grey Wolf" ,artist: %{name: "NargilFlameWolf" } ,description: "Actual artist: PlamyaFox, \nthe art and description belongs to PlamyaFox\nArtist gallery: https://www.furaffinity.net/user/plamyafox\nAmulet in the form of a wolf charmed by the light of the moon" ,current_bid: 50 },
%{extern_id: "788" ,title: "Black Wolf" ,artist: %{name: "NargilFlameWolf" } ,description: "Actual artist: PlamyaFox, \nthe art and description belongs to PlamyaFox\nArtist gallery: https://www.furaffinity.net/user/plamyafox\nAmulet in the form of a Black Wolf charmed by the Light of the moon." ,current_bid: 50 },
%{extern_id: "789" ,title: "Keeper of the Red Stone" ,artist: %{name: "NargilFlameWolf" } ,description: "Actual artist: PlamyaFox, \nthe art and description belongs to PlamyaFox\nArtist gallery: https://www.furaffinity.net/user/plamyafox\nFox amulet" ,current_bid: 80 },
%{extern_id: "790" ,title: "Amulet Capricorn" ,artist: %{name: "NargilFlameWolf" } ,description: "Actual artist: PlamyaFox, \nthe art and description belongs to PlamyaFox\nArtist gallery: https://www.furaffinity.net/user/plamyafox\nAmulet is made in the form of a goat with zodiacal meaning." ,current_bid: 50 },
%{extern_id: "791" ,title: "Amulet for two \"fox trail\"" ,artist: %{name: "NargilFlameWolf" } ,description: "Actual artist: PlamyaFox, \nthe art and description belongs to PlamyaFox\nArtist gallery: https://www.furaffinity.net/user/plamyafox\nThe decoration is intended for people who love each other." ,current_bid: 50 },
%{extern_id: "792" ,title: "Furious werecat" ,artist: %{name: "NargilFlameWolf" } ,description: "Actual artist: PlamyaFox, \nthe art and description belongs to PlamyaFox\nArtist gallery: https://www.furaffinity.net/user/plamyafox\nAmulet in the form of a wild werecat" ,current_bid: 50 },
%{extern_id: "793" ,title: "Dragon Red Eye." ,artist: %{name: "NargilFlameWolf" } ,description: "Actual artist: PlamyaFox, \nthe art and description belongs to PlamyaFox\nArtist gallery: https://www.furaffinity.net/user/plamyafox\nAmulet" ,current_bid: 30 },
%{extern_id: "794" ,title: "Dragon Yelloy Eye" ,artist: %{name: "NargilFlameWolf" } ,description: "Actual artist: PlamyaFox, \nthe art and description belongs to PlamyaFox\nArtist gallery: https://www.furaffinity.net/user/plamyafox\nAmulet" ,current_bid: 30 },
%{extern_id: "795" ,title: "Amulet for two “Trail\"" ,artist: %{name: "NargilFlameWolf" } ,description: "Actual artist: PlamyaFox, \nthe art and description belongs to PlamyaFox\nArtist gallery: https://www.furaffinity.net/user/plamyafox\nThe decoration is intended for people who love each other." ,current_bid: 30 },
%{extern_id: "796" ,title: "Keeper of the Yellow moon" ,artist: %{name: "NargilFlameWolf" } ,description: "Actual artist: PlamyaFox, \nthe art and description belongs to PlamyaFox\nArtist gallery: https://www.furaffinity.net/user/plamyafox\nAmulet Grey fox." ,current_bid: 80 },
%{extern_id: "797" ,title: "Mountain Dragon Bag" ,artist: %{name: "NargilFlameWolf" } ,description: "" ,current_bid: 250 },
%{extern_id: "798" ,title: "Three shining carnivores" ,artist: %{name: "NargilFlameWolf" } ,description: "This guys glow in the dark!" ,current_bid: 50 },
%{extern_id: "799" ,title: "Warm winter" ,artist: %{name: "NargilFlameWolf" } ,description: "" ,current_bid: 100 },
%{extern_id: "800" ,title: "Cunning Firefox" ,artist: %{name: "NargilFlameWolf" } ,description: "" ,current_bid: 30 },
%{extern_id: "855" ,title: "flying wolf" ,artist: %{name: "EosFoxx" } ,description: "d" ,current_bid: 400 },
%{extern_id: "852" ,title: "Felted  Dodger" ,artist: %{name: "EosFoxx" } ,description: "fnart" ,current_bid: 10 },
%{extern_id: "812" ,title: "Tinted" ,artist: %{name: "S0S2" } ,description: "The world is always in motion.\n(S0S2's agent is EosFoxx)" ,current_bid: 380 },
%{extern_id: "813" ,title: "Wild Horse" ,artist: %{name: "Windmelodie" } ,description: "Black Copic Marker and watercolor\n(EosFoxx is agent)" ,current_bid: 300 },
%{extern_id: "817" ,title: "Brown Beauty" ,artist: %{name: "Windmelodie" } ,description: "" ,current_bid: 400 },
%{extern_id: "815" ,title: "GreyBeauty" ,artist: %{name: "Windmelodie" } ,description: "" ,current_bid: 400 },
%{extern_id: "872" ,title: "Bound Fox" ,artist: %{name: "Revaivwra" } ,description: "Chibi Fox Character, Sfw, Bound in Ropes, cute, polychromos on Bristol" ,current_bid: 210 },
%{extern_id: "868" ,title: "Ink Wolf" ,artist: %{name: "Revaivwra" } ,description: "Inked,  Wolf Lineart on Bristol paper,sfw\nagent is EosFoxx" ,current_bid: 90 },
%{extern_id: "870" ,title: "Dancer" ,artist: %{name: "Revaivwra" } ,description: "Sfw Poledancing Anthro, Aquarell and Ink" ,current_bid: 420 },
%{extern_id: "731" ,title: "Lost of Grounding" ,artist: %{name: "Tyger" } ,description: "" ,current_bid: 400 },
%{extern_id: "732" ,title: "Unicorn" ,artist: %{name: "Tyger" } ,description: "" ,current_bid: 400 },
%{extern_id: "733" ,title: "Qliphotic Lion" ,artist: %{name: "Tyger" } ,description: "" ,current_bid: 400 },
%{extern_id: "866" ,title: "Fjord pony" ,artist: %{name: "Nwar" } ,description: "" ,current_bid: 500 },
%{extern_id: "867" ,title: "Happy Holidays" ,artist: %{name: "Nwar" } ,description: "" ,current_bid: 200 },
%{extern_id: "871" ,title: "Nocturnal flight" ,artist: %{name: "Nwar" } ,description: "" ,current_bid: 300 },
%{extern_id: "869" ,title: "Full moon" ,artist: %{name: "Nwar" } ,description: "" ,current_bid: 300 },
%{extern_id: "738" ,title: "COMMISSION: \"Full Details\" Scene Illustration" ,artist: %{name: "Zelaphas" } ,description: "Opening bid covers a single character and a simple background with props and clothing (as desired by the winner). Depending on final bid and request complexity, more characters or background/props/clothing details can be added. Your character will be illustrated in a scene of your choosing, or as suggested by the artist if you need help with ideas! Artist prefers medieval fantasy or natural scenes, including magicians, wandering merchants, barbaric warriors, archers, or all manner of snarling beasts. See https://zelaphas.com/commission for details and Terms of Service. Winner of bid agrees to Terms of Service." ,current_bid: 1600 },
%{extern_id: "739" ,title: "TBD: Large Postcard + Details (1)" ,artist: %{name: "Zelaphas" } ,description: "TBD - Ink and marker on a postcard\nOne of my signature art styles – black Micron ink (various sizes) on a variety of postcard types – was something born out of necessity from my months of traveling around the world and living out of a suitcase. Art supplies can be quite bulky, but basic inking tools are small enough to fit in any carry-on, and postcards can be purchased, drawn on, and shipped out without taking any luggage space. My postcards started as souvenirs bought in stores, but I’ve since used my own travel photography to create (and standardize) my own." ,current_bid: 670 },
%{extern_id: "740" ,title: "TBD: Large Postcard + Details (2)" ,artist: %{name: "Zelaphas" } ,description: "TBD - Ink and marker on a postcard\nOne of my signature art styles – black Micron ink (various sizes) on a variety of postcard types – was something born out of necessity from my months of traveling around the world and living out of a suitcase. Art supplies can be quite bulky, but basic inking tools are small enough to fit in any carry-on, and postcards can be purchased, drawn on, and shipped out without taking any luggage space. My postcards started as souvenirs bought in stores, but I’ve since used my own travel photography to create (and standardize) my own." ,current_bid: 670 },
%{extern_id: "741" ,title: "TBD: Standard Postcard (1)" ,artist: %{name: "Zelaphas" } ,description: "TBD - Ink  on a postcard \nOne of my signature art styles – black Micron ink (various sizes) on a variety of postcard types – was something born out of necessity from my months of traveling around the world and living out of a suitcase. Art supplies can be quite bulky, but basic inking tools are small enough to fit in any carry-on, and postcards can be purchased, drawn on, and shipped out without taking any luggage space. My postcards started as souvenirs bought in stores, but I’ve since used my own travel photography to create (and standardize) my own." ,current_bid: 260 },
%{extern_id: "742" ,title: "TBD: Standard Postcard (2)" ,artist: %{name: "Zelaphas" } ,description: "TBD - Ink  on a postcard \nOne of my signature art styles – black Micron ink (various sizes) on a variety of postcard types – was something born out of necessity from my months of traveling around the world and living out of a suitcase. Art supplies can be quite bulky, but basic inking tools are small enough to fit in any carry-on, and postcards can be purchased, drawn on, and shipped out without taking any luggage space. My postcards started as souvenirs bought in stores, but I’ve since used my own travel photography to create (and standardize) my own." ,current_bid: 260 },
%{extern_id: "743" ,title: "Räven raskar över isen" ,artist: %{name: "Tȍbbè" } ,description: "SE: Isen överraskar räven.\nEN: The ice surprises the fox." ,current_bid: 320 },
%{extern_id: "744" ,title: "Övergångsställe" ,artist: %{name: "Tȍbbè" } ,description: "Just ahead over the road." ,current_bid: 320 },
%{extern_id: "745" ,title: "IEEE754.DLL" ,artist: %{name: "Tȍbbè" } ,description: "When an alien tells you something abstract about Windows..." ,current_bid: 320 },
%{extern_id: "735" ,title: "Glittr (Previously called Bubbles)" ,artist: %{name: "Patchwork Pug" } ,description: "Made by Patchwork Pug in 2017 as an african wild dog, includes head/paws/tail. Head fits most, but roughly 22 inch, paws are medium. Only one previous owner." ,current_bid: 1000 },
%{extern_id: "801" ,title: "Fluffy" ,artist: %{name: "Clawdore" } ,description: "" ,current_bid: 200 },
%{extern_id: "802" ,title: "Lovers" ,artist: %{name: "Clawdore" } ,description: "" ,current_bid: 200 },
%{extern_id: "803" ,title: "Hands" ,artist: %{name: "Clawdore" } ,description: "" ,current_bid: 200 },
%{extern_id: "804" ,title: "Menacing" ,artist: %{name: "Clawdore" } ,description: "" ,current_bid: 200 },
%{extern_id: "805" ,title: "Tears" ,artist: %{name: "Clawdore" } ,description: "" ,current_bid: 200 },
%{extern_id: "806" ,title: "Metal" ,artist: %{name: "Clawdore" } ,description: "" ,current_bid: 200 },
%{extern_id: "807" ,title: "Tribal" ,artist: %{name: "Clawdore" } ,description: "" ,current_bid: 200 },
%{extern_id: "808" ,title: "Overcharge" ,artist: %{name: "Clawdore" } ,description: "" ,current_bid: 200 },
%{extern_id: "809" ,title: "Forest" ,artist: %{name: "Clawdore" } ,description: "" ,current_bid: 200 },
%{extern_id: "810" ,title: "Claws" ,artist: %{name: "Clawdore" } ,description: "" ,current_bid: 200 },
%{extern_id: "811" ,title: "Ancient" ,artist: %{name: "Clawdore" } ,description: "" ,current_bid: 200 },
%{extern_id: "877" ,title: "Mausie Charity T-Shirt" ,artist: %{name: "Alpha_Ki" } ,description: "Limited edition - only this size available." ,current_bid: 200 },
%{extern_id: "721" ,title: "Blue Hour" ,artist: %{name: "Oakspirit" } ,description: "" ,current_bid: 1000 },
%{extern_id: "722" ,title: "Beaver" ,artist: %{name: "Oakspirit" } ,description: "" ,current_bid: 700 },
%{extern_id: "723" ,title: "Fisherman" ,artist: %{name: "Oakspirit" } ,description: "" ,current_bid: 1500 },
%{extern_id: "724" ,title: "Rancher" ,artist: %{name: "Oakspirit" } ,description: "" ,current_bid: 1500 },
%{extern_id: "725" ,title: "Naughty" ,artist: %{name: "Oakspirit" } ,description: "NSFW" ,current_bid: 1000 },
%{extern_id: "726" ,title: "Bound Lion I" ,artist: %{name: "Oakspirit" } ,description: "NSFW" ,current_bid: 1200 },
%{extern_id: "727" ,title: "Bound Lion II" ,artist: %{name: "Oakspirit" } ,description: "" ,current_bid: 700 },
%{extern_id: "748" ,title: "Tres Chiles" ,artist: %{name: "Tracy \"Calicougar\" Reynolds" } ,description: "3 chiles, red yellow green" ,current_bid: 200 },
%{extern_id: "749" ,title: "Big Red Chile" ,artist: %{name: "Tracy \"Calicougar\" Reynolds" } ,description: "" ,current_bid: 200 }
]
end
    
    
  
end
