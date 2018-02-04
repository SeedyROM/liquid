defmodule Liquid.Router do
    use Plug.Router

    if Mix.env == :dev do
        use Plug.Debugger
    end
    
    plug Plug.Logger
    plug :match
    plug :dispatch

    get "/test" do
        send_resp(conn, 200, "POUR ONE OUT")
    end

    get "/user/:username" do
        send_resp(conn, 200, "You are #{username}")
    end
end