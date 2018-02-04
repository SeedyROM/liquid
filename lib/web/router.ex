defmodule Liquid.Router do
    use Plug.Router

    if Mix.env == :dev do
        use Plug.Debugger
    end
    
    plug Plug.Logger
    plug :match
    plug :dispatch

    # Serve static files
    plug Plug.Static, from: "priv/static"

    get "/test" do
        send_resp(conn, 200, "POUR ONE OUT")
    end

    get "/user/:username" do
        send_resp(conn, 200, "You are #{username} and you are a very nice person/thing.")
    end
end