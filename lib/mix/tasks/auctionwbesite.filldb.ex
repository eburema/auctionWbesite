defmodule Mix.Tasks.AuctionWbesite.FillDb do
  use Mix.Task

  def run(_args) do
    Mix.Task.run("app.start")
    Mix.shell.info("Starting!")
  end
end
