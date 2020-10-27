defmodule LiveviewGleamExampleWeb.PageLive do
  use LiveviewGleamExampleWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{users: []})}
  end

  @impl true
  def handle_event("calculate", _params, socket) do
    num = :rand.uniform(20)
    users = generate_random_users(num)
    financial_infos = generate_random_financial_info(num)

    processed_users =
      Enum.map(0..num, fn idx ->
        user = Enum.at(users, idx)
        fi = Enum.at(financial_infos, idx)
        user_w_credit =
          :liveview_gleam_example@heavy_calculations.populate_user_with_credit(
            {:public_user, user.name, user.last_name, false},
            {:financial_information, fi.account_total, fi.score, fi.average}
          )
          |> from_user_to_map()
        IO.inspect(user_w_credit, label: "+ ELIXIR +")
        IO.puts("\n")
        user_w_credit
      end)

    {:noreply, assign(socket, :users, processed_users)}
  end

  defp from_user_to_map({:public_user, first_name, last_name, credit_approved}) do
    %{
      name: first_name,
      last_name: last_name,
      credit_approved: credit_approved
    }
  end

  defp generate_random_users(num) do
    Enum.into(0..num, [], fn _ ->
      %{
        name: Faker.Person.first_name(),
        last_name: Faker.Person.last_name()
      }
    end)
  end

  defp generate_random_financial_info(num) do
    Enum.into(0..num, [], fn _ ->
      %{
        account_total: :rand.uniform(3_000),
        score: :rand.uniform(200) + 500,
        average: :rand.uniform(2_000)
      }
    end)
  end
end
