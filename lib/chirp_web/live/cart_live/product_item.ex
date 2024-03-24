defmodule ChirpWeb.CartLive.ProductItem do
  use ChirpWeb, :live_component


  # def render(assigns) do
  #   ~H"""
  #   <div class="bg-grey" :for={name <- 1..3}> Product </div>
  #   """
  # end

  def render(assigns) do
    ~H"""
    <div class="hero"><%= @content %></div>
    """
  end

end
