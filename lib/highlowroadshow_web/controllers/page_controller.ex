defmodule HighlowroadshowWeb.PageController do
  use HighlowroadshowWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
