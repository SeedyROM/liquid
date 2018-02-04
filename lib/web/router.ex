defmodule Liquid.Router do
    use Plug.Router

    if Mix.env == :dev do
        use Plug.Debugger
        plug Plug.Logger
    end
    
    plug Liquid.StaticFiles

    plug :match
    plug :dispatch

    get "/test" do
        send_resp(conn, 200, "POUR ONE OUT")
    end

    get "/user/:username" do
        send_resp(conn, 200, "You are #{username} and you are a very nice person/thing.")
    end

    match _ do
        send_resp(conn, 404, "Page not found!")
    end
end