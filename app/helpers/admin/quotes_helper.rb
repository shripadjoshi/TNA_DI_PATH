module Admin::QuotesHelper

  def get_fav_text(quote)
    if quote.sys_favourite?
      return "Un-Mark Sys. Favourite"
    else
      return "Mark Sys. Favourite"
    end
  end
end
