defmodule Sk do
  use Calliope

  def generate() do
    {:ok, data} = TomlElixir.parse_file("works.toml")

    works =
      data["works"]
      |> format_dates
      |> Enum.reverse()

    {:ok, index_file} = File.read("templates/index.haml")
    works_data = [works: works]
    parsed_index_file = Calliope.render(index_file, works_data)
    wrap_in_layout("index.html", "Writings of Søren Kierkegaard", parsed_index_file)

    works
    |> Enum.each(fn work ->
      url = work |> elem(0)
      data = work |> elem(1)

      {:ok, work_file} = File.read("templates/work.haml")

      work_data = [
        url: url,
        title: data["title"],
        pdf: data["pdf"],
        author: data["author"],
        date: data["date"],
        description: data["description"],
        cover: data["cover"]
      ]

      parsed_work_file = Calliope.render(work_file, work_data)
      wrap_in_layout("#{url}.html", data["title"], parsed_work_file)

      work
    end)
  end

  defp wrap_in_layout(out_file, title, body) do
    {:ok, layout_file} = File.read("templates/layout.haml")
    layout_data = [title: title, body: body]
    parsed_layout_file = Calliope.render(layout_file, layout_data)

    File.write("docs/#{out_file}", parsed_layout_file)
  end

  defp format_dates(works) do
    works
    |> Enum.map(fn work ->
      key = work |> elem(0)
      data = work |> elem(1)
      {:ok, date} = Date.from_iso8601(data["date"])

      day =
        case date.day do
          day when day in [1, 21, 31] -> "#{date.day}st"
          day when day in [2, 3, 22, 23] -> "#{date.day}rd"
          _ -> "#{date.day}th"
        end

      month =
        case date.month do
          0 -> "Jan"
          1 -> "Feb"
          2 -> "Mar"
          3 -> "Apr"
          4 -> "May"
          5 -> "Jun"
          6 -> "Jul"
          7 -> "Aug"
          8 -> "Sep"
          9 -> "Oct"
          10 -> "Nov"
          11 -> "Dec"
        end

      {key,
       %{
         "author" => data["author"],
         "date" => "#{month} #{day}, #{date.year}",
         "pdf" => data["pdf"],
         "title" => data["title"],
         "description" => data["description"],
         "cover" => data["cover"]
       }}
    end)
  end
end

Sk.generate()
