defmodule ParkingApp.Router do
  use ParkingApp.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ParkingApp do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

  end

#   Other scopes may use custom stacks.
   scope "/api", ParkingApp do
     pipe_through :api

     post "/search_parkings", BookingController, :searchParkings
   end
end
