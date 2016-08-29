module PagesHelper
  def link_to_home_brand(ctrl_name)
    case ctrl_name
    when 'stuk_todo_tasks'
      text = 'Stukdo'
      path = stuk_todo_path
    when 'stuk_books'
      text = 'eStuk'
      path = estuk_path
    when /stuk_starter/
      text = 'Stuk Starter'
      path = stuk_starter_path
    when 'stuk_places'
      text = 'Stuk Places'
      path = stuk_places_path
    end

    link_to "<i class='fa fa-circle-o-notch'></i> #{text}".html_safe, path, class: 'navbar-brand'
  end
end