defmodule ChirpWeb.CartLive.Index do
  use ChirpWeb, :live_view
  alias ChirpWeb.CartLive.ProductItem

  def mount(params, session, socket) do
    {:ok, assign(socket, total_items: 10, content: "content set form parent to child product component")}
  end

  def handle_params(params, _, socket) do
    # IO.inspect(Phoenix.Router.route_info(params["uri"]))
    IO.puts("param uri" )
    name = params["name"] || "guest"
    {:noreply, assign(socket, name: name)}
  end

  def render(assigns) do
    ~H"""
      <h1>hello <strong><%= @name%></strong>,  process = <%= self() |> :erlang.pid_to_list() %>, total <%= @total_items%> </h1>
      <button phx-click="add" class="bg-indigo-500 p-3 text-xl">+</button>
      <button phx-click="sub" class="bg-indigo-500 p-3 text-xl">-</button>
      <.live_component module={ProductItem} id="hero" content={@content}/>
    """
  end

  def handle_event("add", _, socket) do
    # {:noreply, assign(socket, total_items: socket.assigns.total_items + 1)}
    {:noreply, update(socket, :total_items, &(&1 + 1))}
  end

  def handle_event("sub", _, socket) do
    # {:noreply, assign(socket, total_items: socket.assigns.total_items + 1)}
    {:noreply, update(socket, :total_items, &(&1 - 1))}
  end


end
