defmodule LiveSelectWeb.ShowcaseLive do
  use LiveSelectWeb, :live_view

  @destinations (for id <- 1..500 do
       {Faker.Address.city(), id}
     end ++
       for id <- 501..701 do
         {Faker.Address.country(), id}
       end
    |> Enum.sort())

  @impl true
  def mount(_params, _session, socket) do
    socket = assign(socket, change_msg: :change, options: 10)

    {:ok, socket}
  end

  @impl true
  def handle_event(event, params, socket) do
    IO.inspect(event, label: "EVENT")
    IO.inspect(params, label: "PARAMS")

    {:noreply, socket}
  end

  @impl true
  def handle_info(message, socket) do
    print_message(message)
    change_msg = socket.assigns.change_msg

    case message do
      {^change_msg, text} ->
        send_update(LiveSelect,
          id: "live_select",
          options: destinations(text)
        )

      _ ->
        IO.puts("unknown message")
    end

    {:noreply, socket}
  end

  defp print_message(message) do
    IO.inspect(message, label: "MESSAGE")
  end

  defp destinations(""), do: []

  defp destinations(text) do
    @destinations
    |> Enum.filter(fn {name, _id} ->
      String.contains?(String.downcase(name), String.downcase(text))
    end)
  end
end
