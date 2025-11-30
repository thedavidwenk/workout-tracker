module ApplicationHelper
  def nav_link_class(path)
    base = "rounded-md px-3 py-2 text-sm font-medium transition duration-300 ease-in-out text-gray-800"

    if current_page?(path)
      # Active state from your example
      "#{base} bg-gray-300 text-black void:hover"
    else
      # Inactive but still styled appropriately
      "#{base} text-gray-300 hover:bg-gray-700 hover:text-white"
    end
  end
end