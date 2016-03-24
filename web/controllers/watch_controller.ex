defmodule Rumbl.WatchController do
  use Rumbl.Web, :controller
  alias Rumbl.Video
  alias Rumbl.VideoChannel

  def show(conn, %{"id" => id}) do
    video = Repo.get!(Video, id)
    render conn, "show.html", video: video
  end

  def tweet(conn, %{"video_id" => video_id}) do
    topic = "videos:#{video_id}";
    IO.puts('============= controller tweet topic: #{topic}')
    Rumbl.Endpoint.broadcast(topic, "tweet", %{msg: "twetmsg"})
    json conn, %{status: "ok"}
  end
end