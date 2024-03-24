defmodule ChirpWeb.ThermoLive.Index do
  use Phoenix.LiveView


  def render(assigns) do
    ~H"""

    <div class="thermostat">
      <div class="bar">
        <a href="#" phx-click="toggle-mode"></a>
      </div>
      <div class="controls">
        <span class="reading"><%= @temperature%></span>
        <button phx-click="dec_temperature" class="minus">-</button>
        <button phx-click="inc_temperature" class="plus">+</button>
        <span class="weather">
        </span>
      </div>
    </div>
    <.link patch={"http://localhost:4000/cart"}>cart</.link>


    """
  end
  def mount(%{"house" => house}, _session, socket) do
    # IO.puts("house=" <> house)
    temperature = 30 # Let's assume a fixed temperature for now
    {:ok, assign(socket, :temperature, temperature)}
  end

  def handle_event("inc_temperature", _params, socket) do
    {:noreply, update(socket, :temperature, &(&1 + 1))}
  end

  def handle_event("dec_temperature", _params, socket) do
    {:noreply, update(socket, :temperature, &(&1 - 1))}
  end



end
