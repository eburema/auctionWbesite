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
%{extern_id: "878" ,title: "Turquoise paw amulet" ,artist: %{name: "NargilFlameWolf" } ,description: "N/A" ,current_bid: 50 },
%{extern_id: "879" ,title: "DarkBlue Paw Amulet" ,artist: %{name: "NargilFlameWolf" } ,description: "N/A" ,current_bid: 50 },
%{extern_id: "880" ,title: "Greenleaf Paw Amulet" ,artist: %{name: "NargilFlameWolf" } ,description: "N/A" ,current_bid: 50 },
%{extern_id: "881" ,title: "Bronze Paw Amulet 1" ,artist: %{name: "NargilFlameWolf" } ,description: "N/A" ,current_bid: 50 },
%{extern_id: "882" ,title: "Bronze Paw Amulet - 2" ,artist: %{name: "NargilFlameWolf" } ,description: "N/A" ,current_bid: 50 },
%{extern_id: "883" ,title: "Frozen Paw Amulet" ,artist: %{name: "NargilFlameWolf" } ,description: "N/A" ,current_bid: 50 },
%{extern_id: "884" ,title: "White Paw Amulet" ,artist: %{name: "NargilFlameWolf" } ,description: "N/A" ,current_bid: 50 },
%{extern_id: "885" ,title: "Light Paw Amulet" ,artist: %{name: "NargilFlameWolf" } ,description: "N/A" ,current_bid: 50 },
%{extern_id: "886" ,title: "Bronze Paw Amulet - 3" ,artist: %{name: "NargilFlameWolf" } ,description: "N/A" ,current_bid: 50 },
%{extern_id: "887" ,title: "Rhune Paw Amulet" ,artist: %{name: "NargilFlameWolf" } ,description: "N/A" ,current_bid: 50 },
%{extern_id: "888" ,title: "Dark Paw Amulet" ,artist: %{name: "NargilFlameWolf" } ,description: "N/A" ,current_bid: 50 }
]
end
    
    
  
end
